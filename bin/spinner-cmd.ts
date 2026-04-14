#!/usr/bin/env -S deno run --allow-net --allow-read --allow-write --allow-env --node-modules-dir

import ora from "npm:ora@8";
import { Client } from "https://deno.land/x/mysql@v2.12.1/mod.ts";
import { configLogger } from "https://deno.land/x/mysql@v2.12.1/mod.ts";

interface MySQLConfig {
    hostname: string;
    username: string;
    password: string;
    db: string;
    port?: number;
}

function formatTime(ms: number): string {
    const seconds = Math.floor(ms / 100) / 10;
    const minutes = Math.floor(seconds / 60);

    if (minutes > 0) {
        return `${minutes}m ${seconds % 60}s`;
    }
    return `${seconds}s`;
}

function getConfig(): MySQLConfig {
    return {
        hostname: Deno.env.get("DB_HOST") || "34.32.159.87",
        username: Deno.env.get("DB_USERNAME") || "test_sander_paydia_write",
        password: Deno.env.get("DB_PASSWORD") || "UAwzt8DzkaMMw2FHAb47n5VX",
        db: Deno.env.get("DB_DATABASE") || "test-sander.paydia.flexpedia.nl",
        port: parseInt(Deno.env.get("MYSQL_PORT") || "3306"),
    };
}

async function runMySQLWithSpinner(sqlFile: string, config: MySQLConfig) {
    let spinner;
    let timerInterval;

    spinner = ora({
        text: `Connecting to ${config.hostname}...`,
        spinner: "dots",
        color: "cyan",
    }).start();

    let startTime = Date.now();
    let queryNumber = 0;
    const client = await new Client().connect(config);

    spinner.text = `Running MySQL: ${sqlFile}`;
    timerInterval = setInterval(() => {
        const elapsed = Date.now() - startTime;
        spinner.text = `Running query ${queryNumber}: (${formatTime(elapsed)})`;
    }, 100);

    try {
        const sqlContent = await Deno.readTextFile(sqlFile);
        const statements = sqlContent
            .split(';')
            .map(s => s.trim())
            .filter(s => s.length > 0);

        const results = [];

        for (const statement of statements) {
            startTime = Date.now();
            queryNumber += 1;
            try {
                const result = await client.query(statement);
                const elapsed = Date.now() - startTime;
                results.push({
                    result: result,
                    total: result.length,
                    elapsed: `${formatTime(elapsed)}`,
                });
            } catch (err) {
                console.error(`Error executing: ${statement.substring(0, 50)}...`);
                throw err;
            }
        }

        await client.close();

        if (timerInterval) clearInterval(timerInterval);

        const elapsed = Date.now() - startTime;

        spinner.succeed(`Completed in ${formatTime(elapsed)}`);
        console.log(JSON.stringify(results))

        Deno.exit(0);
    } catch (error) {
        await client.close();
        if (timerInterval) clearInterval(timerInterval);

        if (spinner) {
            spinner.fail(`Error: ${error.message}`);
        } else {
            console.error(`Error: ${error.message}`);
        }
        Deno.exit(1);
    }
}

await configLogger({ enable: false });
const config = getConfig();
await runMySQLWithSpinner(Deno.args[0], config);

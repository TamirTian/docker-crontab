"use strict";

const util = require('util');
const exec = util.promisify(require('child_process').exec);
const cron = require('node-cron');

const command = process.env.COMMAND;
const crontab = process.env.CRONTAB;

if (!command || !crontab) {
    console.error(`Please set comamnd/crontab of env`);
    process.exit(1);
}

async function execute() {
    let time = new Date();
    console.log(time, `Running a task`);

    const {stdout, stderr} = await exec(command);
    console.log(time, 'stdout:', stdout);
    console.log(time, 'stderr:', stderr);
}


cron.schedule(crontab, () => {
    execute();
});

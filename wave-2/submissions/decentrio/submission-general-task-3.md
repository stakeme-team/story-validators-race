# Decentrio Grafana Dashboard

Our public dashboard: https://story-dashboard.decentrio.ventures/d/UJyurCTWz/story-dashboard?orgId=1&from=1729270800000&to=1729319042005

JSON file: https://gist.github.com/MasterPi-2124/12306bef46c5eeec065245256b9dc8af
# Instructions
First, you need Prometheus and Grafana installed and configured for the dashboard.
Here is an all-in-one script that checks and installs all requirements for the setup.

```bash
wget https://gist.githubusercontent.com/MasterPi-2124/a250c46b14ea4655b3c39ded0a0f53e9/raw/03b202b1adc5ee81742d7bd0d88fad2f495b71b8/story_dashboard.sh
bash story_dashboard.sh
```

> Note: This setup is for servers running Ubuntu, with a Story node already running.
> Note: The default credentials of the dashboard is `admin:admin` and you will need to update the password before continuing.

After the dashboard is ready, you can access and create a datasource by going to `Connections` > `Data sources` > `Add new data source`. Then choose Prometheus as the datasource, add Prometheus listen address and click `Save` to finish.

To import our dashboard, go to `New dashboard` and upload our [JSON file](https://gist.github.com/MasterPi-2124/12306bef46c5eeec065245256b9dc8af), or copy [JSON content](https://gist.githubusercontent.com/MasterPi-2124/12306bef46c5eeec065245256b9dc8af/raw/83ded1581f2bf287d67675f0cdd0c0673d1cb6aa/story_dashboard.json).
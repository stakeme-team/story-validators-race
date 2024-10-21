{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "Prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__elements": {},
  "__requires": [
    {
      "type": "panel",
      "id": "bargauge",
      "name": "Bar gauge",
      "version": ""
    },
    {
      "type": "panel",
      "id": "gauge",
      "name": "Gauge",
      "version": ""
    },
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "10.4.2"
    },
    {
      "type": "panel",
      "id": "graph",
      "name": "Graph (old)",
      "version": ""
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "stat",
      "name": "Stat",
      "version": ""
    },
    {
      "type": "panel",
      "id": "table",
      "name": "Table",
      "version": ""
    },
    {
      "type": "panel",
      "id": "table-old",
      "name": "Table (old)",
      "version": ""
    },
    {
      "type": "panel",
      "id": "text",
      "name": "Text",
      "version": ""
    },
    {
      "type": "panel",
      "id": "timeseries",
      "name": "Time series",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "datasource",
          "uid": "grafana"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "target": {
          "limit": 100,
          "matchAny": false,
          "tags": [],
          "type": "dashboard"
        },
        "type": "dashboard"
      }
    ]
  },
  "description": "Dashboard to monitor cosmos validator",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "gnetId": 15991,
  "graphTooltip": 0,
  "id": null,
  "links": [],
  "liveNow": false,
  "panels": [
    {
      "collapsed": true,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 103,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 6,
            "x": 0,
            "y": 1
          },
          "id": 110,
          "options": {
            "colorMode": "value",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "tendermint_consensus_height{chain_id=\"$chain_id\",type=\"master\"}",
              "instant": false,
              "legendFormat": "{{type}}",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Master Node Block Height",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 7,
            "x": 6,
            "y": 1
          },
          "id": 111,
          "options": {
            "colorMode": "value",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "tendermint_consensus_height{chain_id=\"$chain_id\",type=\"relayer\"}",
              "instant": false,
              "legendFormat": "{{type}}",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Relayer Node Block Height",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 11,
            "x": 13,
            "y": 1
          },
          "id": 112,
          "options": {
            "colorMode": "value",
            "graphMode": "area",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "tendermint_consensus_height{chain_id=\"$chain_id\",type=\"api\"}",
              "instant": false,
              "legendFormat": "{{type}}",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "API Node Block Height",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "max": 1,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              },
              "unit": "bool"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 6,
            "x": 0,
            "y": 5
          },
          "id": 107,
          "options": {
            "minVizHeight": 75,
            "minVizWidth": 75,
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": false,
            "sizing": "auto"
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "builder",
              "exemplar": true,
              "expr": "tendermint_consensus_state_syncing{chain_id=\"$chain_id\",type=\"master\"}",
              "interval": "",
              "legendFormat": "",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Master Syncing",
          "type": "gauge"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "max": 1,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              },
              "unit": "bool"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 7,
            "x": 6,
            "y": 5
          },
          "id": 108,
          "options": {
            "minVizHeight": 75,
            "minVizWidth": 75,
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": false,
            "sizing": "auto"
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "tendermint_consensus_state_syncing{chain_id=\"$chain_id\",type=\"relayer\"}",
              "interval": "",
              "legendFormat": "",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "Relayer Syncing",
          "type": "gauge"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "max": 1,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              },
              "unit": "bool"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 11,
            "x": 13,
            "y": 5
          },
          "id": 109,
          "options": {
            "minVizHeight": 75,
            "minVizWidth": 75,
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": false,
            "sizing": "auto"
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "tendermint_consensus_state_syncing{chain_id=\"$chain_id\",type=\"api\"}",
              "interval": "",
              "legendFormat": "",
              "range": true,
              "refId": "A"
            }
          ],
          "title": "API Syncing",
          "type": "gauge"
        }
      ],
      "title": "Node Health",
      "type": "row"
    },
    {
      "collapsed": false,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 1
      },
      "id": 35,
      "panels": [],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Validator health",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "gridPos": {
        "h": 8,
        "w": 4,
        "x": 0,
        "y": 2
      },
      "id": 59,
      "links": [
        {
          "targetBlank": true,
          "title": "Website",
          "url": "http;//kjnodes.com"
        }
      ],
      "options": {
        "code": {
          "language": "plaintext",
          "showLineNumbers": false,
          "showMiniMap": false
        },
        "content": "\r\n<table style=\"width:100%; height:100%;border:0px solid black;\">\r\n     <td style=\"text-align: center;vertical-align: middle;border:0px solid black; \"><center><img width=\"300px\" src=\"https://avatars.githubusercontent.com/u/90111888?s=400&u=0ec3c81cb9d99a00dc477581111ce2477715d887&v=4\" /></td>\r\n</table>",
        "mode": "html"
      },
      "pluginVersion": "10.4.2",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "refId": "A"
        }
      ],
      "type": "text"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "green",
                "value": 1
              }
            ]
          },
          "unit": "bool"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 2,
        "x": 4,
        "y": 2
      },
      "id": 25,
      "options": {
        "minVizHeight": 75,
        "minVizWidth": 75,
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": false,
        "sizing": "auto"
      },
      "pluginVersion": "10.4.2",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "cosmos_validators_active{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
          "interval": "",
          "legendFormat": "",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Active",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Number of peers node's connected to\n\n(Need to change Threshold)",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "red",
                "value": null
              },
              {
                "color": "rgba(237, 129, 40, 0.89)",
                "value": 1
              },
              {
                "color": "green",
                "value": 2
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 3,
        "x": 6,
        "y": 2
      },
      "id": 27,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "text": {},
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.4.2",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "tendermint_p2p_peers{chain_id=\"$chain_id\",type=\"master\"}",
          "format": "time_series",
          "hide": false,
          "instant": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Connected peers",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Number of missed blocks",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [
            {
              "options": {
                "match": "null",
                "result": {
                  "text": "N/A"
                }
              },
              "type": "special"
            }
          ],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "yellow",
                "value": 1
              },
              {
                "color": "orange",
                "value": 100
              },
              {
                "color": "red",
                "value": 500
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 3,
        "x": 9,
        "y": 2
      },
      "id": 61,
      "maxDataPoints": 100,
      "options": {
        "colorMode": "value",
        "graphMode": "none",
        "justifyMode": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "mean"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "text": {},
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "10.4.2",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "exemplar": false,
          "expr": "cosmos_validator_missed_blocks{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
          "format": "time_series",
          "hide": false,
          "instant": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Missed blocks",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Validator missed blocks",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "drawStyle": "line",
            "fillOpacity": 25,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "smooth",
            "lineStyle": {
              "fill": "solid"
            },
            "lineWidth": 2,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "spanNulls": true,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "yellow",
                "value": 100
              },
              {
                "color": "orange",
                "value": 1000
              },
              {
                "color": "red",
                "value": 5000
              }
            ]
          },
          "unit": "none"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 8,
        "w": 12,
        "x": 12,
        "y": 2
      },
      "id": 60,
      "maxDataPoints": 100,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "8.4.0-beta1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "exemplar": true,
          "expr": "cosmos_validator_missed_blocks{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
          "format": "time_series",
          "instant": false,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "",
          "refId": "A"
        }
      ],
      "title": "Missed blocks",
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "max": 1,
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": null
              },
              {
                "color": "red",
                "value": 1
              }
            ]
          },
          "unit": "bool"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 4,
        "w": 2,
        "x": 4,
        "y": 6
      },
      "id": 54,
      "options": {
        "minVizHeight": 75,
        "minVizWidth": 75,
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": false,
        "sizing": "auto"
      },
      "pluginVersion": "10.4.2",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": true,
          "expr": "tendermint_consensus_state_syncing{chain_id=\"$chain_id\",type=\"master\"}",
          "interval": "",
          "legendFormat": "",
          "range": true,
          "refId": "A"
        }
      ],
      "title": "Syncing",
      "type": "gauge"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 10
      },
      "id": 19,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "max": 1,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              },
              "unit": "bool"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 2,
            "x": 0,
            "y": 3
          },
          "id": 55,
          "options": {
            "minVizHeight": 75,
            "minVizWidth": 75,
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": false,
            "sizing": "auto"
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "cosmos_validator_jailed{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Jailed",
          "type": "gauge"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 2,
            "x": 2,
            "y": 3
          },
          "id": 2,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "vertical",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "value",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sort(cosmos_validator_rank{chain_id=\"$chain_id\", moniker=\"$moniker\"})",
              "instant": false,
              "interval": "",
              "legendFormat": "{{ moniker }}",
              "refId": "A"
            }
          ],
          "title": "Rank",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 4,
            "x": 4,
            "y": 3
          },
          "id": 4,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "vertical",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "value",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "sum(cosmos_validator_delegations{chain_id=\"$chain_id\", moniker=\"$moniker\"}) by (denom)",
              "instant": true,
              "interval": "",
              "legendFormat": "{{ denom }}",
              "refId": "A"
            }
          ],
          "title": "Total delegations",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "max": 1,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 4,
            "x": 8,
            "y": 3
          },
          "id": 5,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "value",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "cosmos_validator_commission_rate{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Commission rate",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 4,
            "x": 12,
            "y": 3
          },
          "id": 11,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "vertical",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "value",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "count(cosmos_validator_delegations{chain_id=\"$chain_id\", moniker=\"$moniker\"})",
              "instant": false,
              "interval": "",
              "legendFormat": "{{ moniker }}",
              "refId": "A"
            }
          ],
          "title": "Delegations count",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 4,
            "x": 16,
            "y": 3
          },
          "id": 13,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "vertical",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "value",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "count(cosmos_validator_redelegations{chain_id=\"$chain_id\", moniker=\"$moniker\"}) OR on() vector(0)",
              "instant": false,
              "interval": "",
              "legendFormat": "{{ moniker }}",
              "refId": "A"
            }
          ],
          "title": "Redelegations count",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 4,
            "x": 20,
            "y": 3
          },
          "id": 17,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "vertical",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "value",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "count(cosmos_validator_unbondings{chain_id=\"$chain_id\", moniker=\"$moniker\"}) OR on() vector(0)",
              "instant": false,
              "interval": "",
              "legendFormat": "{{ moniker }}",
              "refId": "A"
            }
          ],
          "title": "Unbondings count",
          "type": "stat"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "unit": "locale"
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 7
          },
          "hiddenSeries": false,
          "id": 14,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 2,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(cosmos_validator_delegations{chain_id=\"$chain_id\", moniker=\"$moniker\"}) by (moniker, denom)",
              "interval": "",
              "legendFormat": "{{ moniker }}, {{ denom }}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Delegations",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "format": "locale",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "custom": {
                "align": "auto",
                "cellOptions": {
                  "type": "auto"
                },
                "filterable": false,
                "inspect": false
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              },
              "unit": "locale"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Value"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 110
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "moniker"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 122
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "delegated_by"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 444
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 7,
            "w": 16,
            "x": 8,
            "y": 7
          },
          "id": 3,
          "options": {
            "cellHeight": "sm",
            "footer": {
              "countRows": false,
              "fields": "",
              "reducer": [
                "sum"
              ],
              "show": false
            },
            "showHeader": true,
            "sortBy": [
              {
                "desc": true,
                "displayName": "Value"
              }
            ]
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "cosmos_validator_delegations{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
              "format": "table",
              "instant": true,
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Delegations",
          "transformations": [
            {
              "id": "organize",
              "options": {
                "excludeByName": {
                  "Time": true,
                  "__name__": true,
                  "address": true,
                  "chain_id": true,
                  "instance": true,
                  "job": true,
                  "moniker": true
                },
                "indexByName": {
                  "Time": 0,
                  "Value": 7,
                  "address": 1,
                  "chain_id": 3,
                  "delegated_by": 4,
                  "denom": 8,
                  "instance": 5,
                  "job": 6,
                  "moniker": 2
                },
                "renameByName": {}
              }
            }
          ],
          "type": "table"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 14
          },
          "hiddenSeries": false,
          "id": 8,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 2,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(cosmos_validator_redelegations{chain_id=\"$chain_id\", moniker=\"$moniker\"}) by (moniker, denom)",
              "interval": "",
              "legendFormat": "{{ moniker }}, {{ denom }}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Redelegations",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "custom": {
                "align": "auto",
                "cellOptions": {
                  "type": "auto"
                },
                "filterable": false,
                "inspect": false
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Value"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 110
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "moniker"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 122
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "delegated_by"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 379
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 7,
            "w": 16,
            "x": 8,
            "y": 14
          },
          "id": 15,
          "options": {
            "cellHeight": "sm",
            "footer": {
              "countRows": false,
              "fields": "",
              "reducer": [
                "sum"
              ],
              "show": false
            },
            "showHeader": true,
            "sortBy": [
              {
                "desc": true,
                "displayName": "Value"
              }
            ]
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "cosmos_validator_redelegations{chain_id=\"$chain_id\", moniker=\"$moniker\"} ",
              "format": "table",
              "instant": true,
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Redelegations",
          "transformations": [
            {
              "id": "organize",
              "options": {
                "excludeByName": {
                  "Time": true,
                  "chain_id": true,
                  "instance": true,
                  "job": true
                },
                "indexByName": {
                  "Time": 0,
                  "Value": 7,
                  "address": 1,
                  "chain_id": 3,
                  "delegated_by": 4,
                  "denom": 8,
                  "instance": 5,
                  "job": 6,
                  "moniker": 2
                },
                "renameByName": {}
              }
            }
          ],
          "type": "table"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 8,
            "x": 0,
            "y": 21
          },
          "hiddenSeries": false,
          "id": 7,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 2,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "sum(cosmos_validator_unbondings{chain_id=\"$chain_id\", moniker=\"$moniker\"}) by (moniker, denom)",
              "interval": "",
              "legendFormat": "{{ moniker }}, {{ denom }}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Unbondings",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "custom": {
                "align": "auto",
                "cellOptions": {
                  "type": "auto"
                },
                "filterable": false,
                "inspect": false
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Value"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 110
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "moniker"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 122
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "delegated_by"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 379
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 7,
            "w": 16,
            "x": 8,
            "y": 21
          },
          "id": 16,
          "options": {
            "cellHeight": "sm",
            "footer": {
              "countRows": false,
              "fields": "",
              "reducer": [
                "sum"
              ],
              "show": false
            },
            "showHeader": true,
            "sortBy": [
              {
                "desc": true,
                "displayName": "exemplar"
              }
            ]
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "cosmos_validator_unbondings{chain_id=\"$chain_id\", moniker=\"$moniker\"} ",
              "format": "table",
              "instant": true,
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Unbondings",
          "transformations": [
            {
              "id": "organize",
              "options": {
                "excludeByName": {
                  "Time": true,
                  "__name__": true,
                  "address": true,
                  "chain_id": true,
                  "instance": true,
                  "job": true,
                  "moniker": true
                },
                "indexByName": {
                  "Time": 0,
                  "Value": 7,
                  "address": 1,
                  "chain_id": 3,
                  "denom": 8,
                  "instance": 4,
                  "job": 5,
                  "moniker": 2,
                  "unbonded_by": 6
                },
                "renameByName": {}
              }
            }
          ],
          "type": "table"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 0,
            "y": 28
          },
          "hiddenSeries": false,
          "id": 10,
          "legend": {
            "avg": false,
            "current": false,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": false
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 2,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "cosmos_validator_rewards{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
              "interval": "",
              "legendFormat": "{{ moniker }}, {{ denom }}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Rewards",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "unit": "locale"
            },
            "overrides": []
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 7,
            "w": 12,
            "x": 12,
            "y": 28
          },
          "hiddenSeries": false,
          "id": 6,
          "legend": {
            "avg": false,
            "current": true,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 2,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "cosmos_validator_commission{chain_id=\"$chain_id\", moniker=\"$moniker\"}",
              "interval": "",
              "legendFormat": "{{ moniker }}, {{ denom }}",
              "refId": "A"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Commission",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:162",
              "decimals": 4,
              "format": "locale",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:163",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Validator stats",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 11
      },
      "id": 21,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Height of the chain",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 6,
            "x": 0,
            "y": 4
          },
          "id": 37,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "max(tendermint_consensus_height{chain_id=\"$chain_id\"})",
              "format": "time_series",
              "hide": false,
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Block height",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Number of validators who did not sign",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 1
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 4,
            "x": 6,
            "y": 4
          },
          "id": 47,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "tendermint_consensus_missing_validators{chain_id=\"$chain_id\",type=\"master\"}",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Offline validators",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Total number of transactions committed",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 2,
            "x": 10,
            "y": 4
          },
          "id": 43,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "tendermint_consensus_total_txs{chain_id=\"$chain_id\",type=\"master\"}",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Confirmed Tx",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Number of validators missing blocks",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 1
                  },
                  {
                    "color": "orange",
                    "value": 100
                  },
                  {
                    "color": "red",
                    "value": 500
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 3,
            "x": 12,
            "y": 4
          },
          "id": 98,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "count(cosmos_validators_missed_blocks{chain_id=\"$chain_id\"} > 0) OR on() vector(0)",
              "format": "time_series",
              "hide": false,
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Validators missing blocks",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "custom": {
                "align": "auto",
                "cellOptions": {
                  "type": "auto"
                },
                "inspect": false
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "red",
                    "value": 80
                  }
                ]
              }
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "moniker"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 150
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "address"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 430
                  },
                  {
                    "id": "links",
                    "value": [
                      {
                        "targetBlank": true,
                        "title": "",
                        "url": "https://$instance.explorers.guru/validator/${__data.fields[\"address\"]}"
                      }
                    ]
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Value"
                },
                "properties": [
                  {
                    "id": "custom.width",
                    "value": 100
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 8,
            "w": 9,
            "x": 15,
            "y": 4
          },
          "id": 102,
          "options": {
            "cellHeight": "sm",
            "footer": {
              "countRows": false,
              "fields": "",
              "reducer": [
                "sum"
              ],
              "show": false
            },
            "showHeader": true,
            "sortBy": [
              {
                "desc": true,
                "displayName": "Value"
              }
            ]
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "sort_desc(topk(10, cosmos_validators_missed_blocks{chain_id=\"$chain_id\"} > 0))",
              "format": "table",
              "instant": true,
              "interval": "",
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Top validators missing blocks",
          "transformations": [
            {
              "id": "organize",
              "options": {
                "excludeByName": {
                  "Time": true,
                  "__name__": true,
                  "address": false,
                  "chain_id": true,
                  "instance": true,
                  "job": true
                },
                "indexByName": {
                  "Time": 3,
                  "Value": 2,
                  "__name__": 4,
                  "address": 1,
                  "chain_id": 5,
                  "instance": 6,
                  "job": 7,
                  "moniker": 0
                },
                "renameByName": {}
              }
            }
          ],
          "type": "table"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "red",
                    "value": null
                  },
                  {
                    "color": "orange",
                    "value": 25
                  },
                  {
                    "color": "yellow",
                    "value": 50
                  },
                  {
                    "color": "green",
                    "value": 100
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 3,
            "x": 0,
            "y": 8
          },
          "id": 39,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "tendermint_consensus_validators-tendermint_consensus_missing_validators{chain_id=\"$chain_id\",type=\"master\"}",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Online validators",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "The total number of bonded tokens in the network",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 3,
            "x": 3,
            "y": 8
          },
          "id": 45,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "tendermint_consensus_validators_power{chain_id=\"$chain_id\",type=\"master\"}",
              "format": "time_series",
              "hide": false,
              "instant": false,
              "interval": "30s",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Total bonded tokens",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Total voting power of the missing validators",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "orange",
                    "value": 1
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 2,
            "x": 6,
            "y": 8
          },
          "id": 41,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "tendermint_consensus_missing_validators_power{chain_id=\"$chain_id\",type=\"master\"}",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Offline: bonded tokens",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Total voting power of the missing validators",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "orange",
                    "value": 1
                  }
                ]
              },
              "unit": "percentunit"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 2,
            "x": 8,
            "y": 8
          },
          "id": 49,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "(tendermint_consensus_missing_validators_power{chain_id=\"$chain_id\",type=\"master\"} / tendermint_consensus_validators_power{chain_id=\"$chain_id\",type=\"master\"})",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Offline: voting power %",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Number of uncommitted transactions",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 5
                  },
                  {
                    "color": "red",
                    "value": 50
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 2,
            "x": 10,
            "y": 8
          },
          "id": 51,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": false,
              "expr": "tendermint_mempool_size{chain_id=\"$chain_id\",type=\"master\"}",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Unconfirmed Tx",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Number of highest missed blocks for validators on chain",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 1
                  },
                  {
                    "color": "orange",
                    "value": 100
                  },
                  {
                    "color": "red",
                    "value": 500
                  }
                ]
              },
              "unit": "none"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 4,
            "w": 3,
            "x": 12,
            "y": 8
          },
          "id": 97,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "max(cosmos_validators_missed_blocks{chain_id=\"$chain_id\"})",
              "format": "time_series",
              "hide": false,
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            }
          ],
          "title": "Top missed blocks",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 33,
                "gradientMode": "opacity",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineStyle": {
                  "fill": "solid"
                },
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "decimals": 2,
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Mempool Size / min"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Successful Tx / min"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 0,
            "y": 12
          },
          "id": 113,
          "options": {
            "legend": {
              "calcs": [
                "min",
                "max",
                "mean",
                "sum"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true,
              "sortBy": "Max",
              "sortDesc": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "8.3.3",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_size{chain_id=\"$chain_id\"}[6h])) * 60",
              "interval": "",
              "legendFormat": "Mempool Size / min",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[6h])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Successful Tx / min",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "avg(rate(tendermint_mempool_failed_txs{chain_id=\"$chain_id\"}[6h])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Failed Tx / min",
              "range": true,
              "refId": "E"
            }
          ],
          "title": "6h Overview Tx / min",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 33,
                "gradientMode": "opacity",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineStyle": {
                  "fill": "solid"
                },
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "decimals": 2,
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Block Time - 24h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Block Time - 6h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Blocks Produced"
                },
                "properties": [
                  {
                    "id": "custom.drawStyle",
                    "value": "bars"
                  },
                  {
                    "id": "custom.fillOpacity",
                    "value": 90
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 0
                  },
                  {
                    "id": "custom.axisPlacement",
                    "value": "hidden"
                  },
                  {
                    "id": "color",
                    "value": {
                      "fixedColor": "blue",
                      "mode": "fixed"
                    }
                  },
                  {
                    "id": "custom.hideFrom",
                    "value": {
                      "legend": true,
                      "tooltip": true,
                      "viz": false
                    }
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 10,
            "w": 12,
            "x": 12,
            "y": 12
          },
          "id": 114,
          "options": {
            "legend": {
              "calcs": [
                "min",
                "max",
                "mean",
                "sum"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true,
              "sortBy": "Max",
              "sortDesc": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "8.3.3",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "1 / avg(rate(tendermint_consensus_height{chain_id=\"$chain_id\"}[15m]))",
              "interval": "",
              "legendFormat": "Block Time - 15min average",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "1 / avg(rate(tendermint_consensus_height{chain_id=\"$chain_id\"}[6h]))",
              "hide": false,
              "interval": "",
              "legendFormat": "Block Time - 6h average",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "1 / avg(rate(tendermint_consensus_height{chain_id=\"$chain_id\"}[1d])) ",
              "hide": false,
              "interval": "",
              "legendFormat": "Block Time - 24h average",
              "range": true,
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "1 / avg(increase(tendermint_consensus_height{chain_id=\"$chain_id\"}[45s]))",
              "hide": false,
              "interval": "",
              "legendFormat": "Blocks Produced",
              "range": true,
              "refId": "E"
            }
          ],
          "title": "Block Speed (seconds)",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 33,
                "gradientMode": "opacity",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineStyle": {
                  "fill": "solid"
                },
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "decimals": 2,
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Tx /min - 24h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Tx /min - 6h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Tx Produced"
                },
                "properties": [
                  {
                    "id": "custom.drawStyle",
                    "value": "bars"
                  },
                  {
                    "id": "custom.fillOpacity",
                    "value": 90
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 0
                  },
                  {
                    "id": "custom.axisPlacement",
                    "value": "hidden"
                  },
                  {
                    "id": "color",
                    "value": {
                      "fixedColor": "blue",
                      "mode": "fixed"
                    }
                  },
                  {
                    "id": "custom.hideFrom",
                    "value": {
                      "legend": true,
                      "tooltip": true,
                      "viz": false
                    }
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 11,
            "w": 19,
            "x": 0,
            "y": 22
          },
          "id": 115,
          "options": {
            "legend": {
              "calcs": [
                "min",
                "max",
                "mean",
                "sum"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true,
              "sortBy": "Max",
              "sortDesc": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "8.3.3",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[15m])) * 60",
              "interval": "",
              "legendFormat": "Tx /min - 15min average",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[6h])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Tx /min - 6h average",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[1d])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Tx /min - 24h average",
              "range": true,
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "avg(increase(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[45s])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Tx Produced",
              "range": true,
              "refId": "E"
            }
          ],
          "title": "Tx / min",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "decimals": 0,
              "mappings": [],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "blue",
                    "value": null
                  }
                ]
              },
              "unit": "locale"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 11,
            "w": 5,
            "x": 19,
            "y": 22
          },
          "id": 116,
          "options": {
            "colorMode": "background",
            "graphMode": "none",
            "justifyMode": "center",
            "orientation": "auto",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(increase(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[5m]))",
              "interval": "",
              "legendFormat": "Last 5m",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(increase(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[1h]))",
              "hide": false,
              "interval": "",
              "legendFormat": "Last 1h",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(increase(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[6h]))",
              "hide": false,
              "interval": "",
              "legendFormat": "Last 6h",
              "range": true,
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(increase(tendermint_consensus_num_txs{chain_id=\"$chain_id\"}[1d]))",
              "hide": false,
              "interval": "",
              "legendFormat": "Last 1d",
              "range": true,
              "refId": "D"
            }
          ],
          "title": "Txn Totals",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 33,
                "gradientMode": "opacity",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineStyle": {
                  "fill": "solid"
                },
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "decimals": 2,
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Mempool Tx /min - 24h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Mempool Tx /min - 6h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Tx Produced"
                },
                "properties": [
                  {
                    "id": "custom.drawStyle",
                    "value": "bars"
                  },
                  {
                    "id": "custom.fillOpacity",
                    "value": 90
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 0
                  },
                  {
                    "id": "custom.axisPlacement",
                    "value": "hidden"
                  },
                  {
                    "id": "color",
                    "value": {
                      "fixedColor": "blue",
                      "mode": "fixed"
                    }
                  },
                  {
                    "id": "custom.hideFrom",
                    "value": {
                      "legend": true,
                      "tooltip": true,
                      "viz": false
                    }
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 0,
            "y": 33
          },
          "id": 117,
          "options": {
            "legend": {
              "calcs": [
                "min",
                "max",
                "mean",
                "sum"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true,
              "sortBy": "Max",
              "sortDesc": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "8.3.3",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_size{chain_id=\"$chain_id\"}[15m])) * 60",
              "interval": "",
              "legendFormat": "Mempool Tx /min - 15min average",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_size{chain_id=\"$chain_id\"}[6h])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Mempool Tx /min - 6h average",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_size{chain_id=\"$chain_id\"}[1d])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Mempool Tx /min - 24h average",
              "range": true,
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "avg(increase(tendermint_mempool_size{chain_id=\"$chain_id\"}[45s])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Tx Produced",
              "range": true,
              "refId": "E"
            }
          ],
          "title": "Mempool Size / min",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 33,
                "gradientMode": "opacity",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineStyle": {
                  "fill": "solid"
                },
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "decimals": 2,
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Failed Tx /min - 24h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Failed Tx /min - 6h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Failed Txs"
                },
                "properties": [
                  {
                    "id": "custom.drawStyle",
                    "value": "bars"
                  },
                  {
                    "id": "custom.fillOpacity",
                    "value": 90
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 0
                  },
                  {
                    "id": "custom.axisPlacement",
                    "value": "hidden"
                  },
                  {
                    "id": "color",
                    "value": {
                      "fixedColor": "blue",
                      "mode": "fixed"
                    }
                  },
                  {
                    "id": "custom.hideFrom",
                    "value": {
                      "legend": true,
                      "tooltip": true,
                      "viz": false
                    }
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 12,
            "y": 33
          },
          "id": 118,
          "options": {
            "legend": {
              "calcs": [
                "min",
                "max",
                "mean",
                "sum"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true,
              "sortBy": "Max",
              "sortDesc": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "8.3.3",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_failed_txs{chain_id=\"$chain_id\"}[15m])) * 60",
              "interval": "",
              "legendFormat": "Failed Tx /min - 15min average",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_failed_txs{chain_id=\"$chain_id\"}[6h])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Failed Tx /min - 6h average",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_mempool_failed_txs{chain_id=\"$chain_id\"}[1d])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Failed Tx /min - 24h average",
              "range": true,
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "avg(increase(tendermint_mempool_failed_txs{chain_id=\"$chain_id\"}[45s])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Failed Txs",
              "range": true,
              "refId": "E"
            }
          ],
          "title": "Failed Tx / min",
          "type": "timeseries"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "palette-classic"
              },
              "custom": {
                "axisBorderShow": false,
                "axisCenteredZero": false,
                "axisColorMode": "text",
                "axisLabel": "",
                "axisPlacement": "auto",
                "barAlignment": 0,
                "drawStyle": "line",
                "fillOpacity": 33,
                "gradientMode": "opacity",
                "hideFrom": {
                  "legend": false,
                  "tooltip": false,
                  "viz": false
                },
                "insertNulls": false,
                "lineInterpolation": "linear",
                "lineStyle": {
                  "fill": "solid"
                },
                "lineWidth": 1,
                "pointSize": 5,
                "scaleDistribution": {
                  "type": "linear"
                },
                "showPoints": "never",
                "spanNulls": false,
                "stacking": {
                  "group": "A",
                  "mode": "none"
                },
                "thresholdsStyle": {
                  "mode": "off"
                }
              },
              "decimals": 2,
              "mappings": [],
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": [
              {
                "matcher": {
                  "id": "byName",
                  "options": "Block Size /min - 24h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Block Size /min - 6h average"
                },
                "properties": [
                  {
                    "id": "custom.fillOpacity",
                    "value": 0
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 2
                  }
                ]
              },
              {
                "matcher": {
                  "id": "byName",
                  "options": "Block Size"
                },
                "properties": [
                  {
                    "id": "custom.drawStyle",
                    "value": "bars"
                  },
                  {
                    "id": "custom.fillOpacity",
                    "value": 90
                  },
                  {
                    "id": "custom.lineWidth",
                    "value": 0
                  },
                  {
                    "id": "custom.axisPlacement",
                    "value": "hidden"
                  },
                  {
                    "id": "color",
                    "value": {
                      "fixedColor": "blue",
                      "mode": "fixed"
                    }
                  },
                  {
                    "id": "custom.hideFrom",
                    "value": {
                      "legend": true,
                      "tooltip": true,
                      "viz": false
                    }
                  }
                ]
              }
            ]
          },
          "gridPos": {
            "h": 11,
            "w": 12,
            "x": 0,
            "y": 44
          },
          "id": 119,
          "options": {
            "legend": {
              "calcs": [
                "min",
                "max",
                "mean",
                "sum"
              ],
              "displayMode": "table",
              "placement": "bottom",
              "showLegend": true,
              "sortBy": "Max",
              "sortDesc": true
            },
            "tooltip": {
              "mode": "multi",
              "sort": "none"
            }
          },
          "pluginVersion": "8.3.3",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_block_size_bytes{chain_id=\"$chain_id\"}[15m])) * 60",
              "interval": "",
              "legendFormat": "Block Size /min - 15min average",
              "range": true,
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_block_size_bytes{chain_id=\"$chain_id\"}[6h])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Block Size /min - 6h average",
              "range": true,
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "exemplar": true,
              "expr": "avg(rate(tendermint_consensus_block_size_bytes{chain_id=\"$chain_id\"}[1d])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Block Size /min - 24h average",
              "range": true,
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "editorMode": "code",
              "expr": "avg(increase(tendermint_consensus_block_size_bytes{chain_id=\"$chain_id\"}[45s])) * 60",
              "hide": false,
              "interval": "",
              "legendFormat": "Block Size",
              "range": true,
              "refId": "E"
            }
          ],
          "title": "Block Size / min",
          "type": "timeseries"
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Chain health",
      "type": "row"
    },
    {
      "collapsed": true,
      "datasource": {
        "type": "prometheus",
        "uid": "PBFA97CFB590B2093"
      },
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 12
      },
      "id": 63,
      "panels": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Core node uptime",
          "fieldConfig": {
            "defaults": {
              "decimals": 1,
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "red",
                    "value": null
                  },
                  {
                    "color": "yellow",
                    "value": 1
                  },
                  {
                    "color": "green",
                    "value": 2
                  }
                ]
              },
              "unit": "s"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 5,
            "w": 2,
            "x": 0,
            "y": 5
          },
          "hideTimeOverride": true,
          "id": 65,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "fieldOptions": {
              "calcs": [
                "lastNotNull"
              ]
            },
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "mean"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "sum(time() - node_boot_time_seconds{instance=\"$instance\"})",
              "format": "time_series",
              "hide": false,
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{alias}}",
              "refId": "A",
              "step": 40
            }
          ],
          "title": "Uptime CT",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "orange",
                    "value": null
                  },
                  {
                    "color": "green",
                    "value": 2
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 2,
            "w": 2,
            "x": 2,
            "y": 5
          },
          "id": 67,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "count(count(node_cpu_seconds_total{instance=~\"$instance\", mode='system'}) by (cpu))",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A",
              "step": 20
            }
          ],
          "title": "CPU",
          "type": "stat"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "decimals": 1,
              "mappings": [],
              "max": 100,
              "min": 0,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "light-yellow",
                    "value": 60
                  },
                  {
                    "color": "dark-red",
                    "value": 85
                  }
                ]
              },
              "unit": "percent"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 5,
            "w": 9,
            "x": 4,
            "y": 5
          },
          "id": 71,
          "interval": "",
          "options": {
            "displayMode": "lcd",
            "maxVizHeight": 300,
            "minVizHeight": 16,
            "minVizWidth": 8,
            "namePlacement": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "last"
              ],
              "fields": "",
              "values": false
            },
            "showUnfilled": true,
            "sizing": "auto",
            "text": {},
            "valueMode": "color"
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "100 - (avg by(alias) (irate(node_cpu_seconds_total{instance=~\"$instance\", mode=\"idle\"}[1m])) * 100)",
              "hide": false,
              "instant": true,
              "interval": "",
              "legendFormat": "CPU",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "(1 - (node_memory_MemAvailable_bytes{instance=~\"$instance\"} / (node_memory_MemTotal_bytes{instance=~\"$instance\"})))* 100",
              "hide": false,
              "instant": true,
              "interval": "",
              "legendFormat": "RAM",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "(1 - (node_memory_SwapFree_bytes{instance=~\"$instance\"} / node_memory_SwapTotal_bytes{instance=~\"$instance\"})) * 100",
              "hide": false,
              "instant": false,
              "interval": "",
              "legendFormat": "SWAP",
              "refId": "E"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "100 - (node_filesystem_free_bytes{instance=~\"$instance\", device=\"/dev/sda2\"} *100 / node_filesystem_size_bytes{instance=~\"$instance\", device=\"/dev/sda2\"})",
              "hide": false,
              "instant": false,
              "interval": "",
              "legendFormat": "Disk",
              "refId": "D"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "100 - (node_filesystem_free_bytes{instance=~\"$instance\", device=\"/dev/sda1\"} *100 / node_filesystem_size_bytes{instance=~\"$instance\", device=\"/dev/sda1\"})",
              "hide": false,
              "interval": "",
              "legendFormat": "Boot",
              "refId": "F"
            }
          ],
          "title": "System Health",
          "type": "bargauge"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "decimals": 2,
              "mappings": [],
              "max": 10000,
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  },
                  {
                    "color": "rgba(237, 129, 40, 0.89)",
                    "value": 7000
                  },
                  {
                    "color": "rgba(245, 54, 54, 0.9)",
                    "value": 9000
                  }
                ]
              },
              "unit": "short"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 5,
            "w": 3,
            "x": 13,
            "y": 5
          },
          "hideTimeOverride": false,
          "id": 73,
          "maxDataPoints": 100,
          "options": {
            "minVizHeight": 75,
            "minVizWidth": 75,
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showThresholdLabels": false,
            "showThresholdMarkers": true,
            "sizing": "auto"
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_filefd_allocated{instance=~\"$instance\"}",
              "format": "time_series",
              "instant": false,
              "interval": "10s",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "B"
            }
          ],
          "title": "Currently open file descriptor",
          "type": "gauge"
        },
        {
          "columns": [],
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fontSize": "120%",
          "gridPos": {
            "h": 5,
            "w": 8,
            "x": 16,
            "y": 5
          },
          "id": 75,
          "scroll": true,
          "showHeader": true,
          "sort": {
            "col": 3,
            "desc": true
          },
          "styles": [
            {
              "$$hashKey": "object:3037",
              "alias": "Time",
              "align": "auto",
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "pattern": "Time",
              "type": "hidden"
            },
            {
              "$$hashKey": "object:3038",
              "alias": "Partition",
              "align": "auto",
              "colors": [
                "#5794F2",
                "rgba(237, 129, 40, 0.89)",
                "rgba(245, 54, 54, 0.9)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "mountpoint",
              "thresholds": [
                ""
              ],
              "type": "string",
              "unit": "bytes"
            },
            {
              "$$hashKey": "object:3039",
              "alias": "Available space",
              "align": "auto",
              "colorMode": "value",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "#5794F2"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "Value #A",
              "thresholds": [
                "10000000000",
                "20000000000"
              ],
              "type": "number",
              "unit": "bytes"
            },
            {
              "$$hashKey": "object:3040",
              "alias": "Usage rate",
              "align": "auto",
              "colorMode": "cell",
              "colors": [
                "#5794F2",
                "rgba(237, 129, 40, 0.89)",
                "rgba(245, 54, 54, 0.9)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "mappingType": 1,
              "pattern": "Value #B",
              "thresholds": [
                "70",
                "90"
              ],
              "type": "number",
              "unit": "percentunit"
            },
            {
              "$$hashKey": "object:3041",
              "alias": "Total space",
              "align": "auto",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 1,
              "link": false,
              "mappingType": 1,
              "pattern": "Value #C",
              "thresholds": [],
              "type": "number",
              "unit": "bytes"
            },
            {
              "$$hashKey": "object:3042",
              "alias": "File system",
              "align": "auto",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "dateFormat": "YYYY-MM-DD HH:mm:ss",
              "decimals": 2,
              "link": false,
              "mappingType": 1,
              "pattern": "fstype",
              "thresholds": [],
              "type": "number",
              "unit": "short"
            },
            {
              "$$hashKey": "object:3043",
              "alias": "",
              "align": "auto",
              "colors": [
                "rgba(245, 54, 54, 0.9)",
                "rgba(237, 129, 40, 0.89)",
                "rgba(50, 172, 45, 0.97)"
              ],
              "decimals": 2,
              "pattern": "/.*/",
              "preserveFormat": true,
              "sanitize": false,
              "thresholds": [],
              "type": "hidden",
              "unit": "short"
            }
          ],
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "node_filesystem_size_bytes{instance=~'$instance',fstype=~\"ext4|xfs\"}",
              "format": "table",
              "hide": true,
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "node_filesystem_avail_bytes {instance=~'$instance',fstype=~\"ext4|xfs\"}",
              "format": "table",
              "hide": false,
              "instant": true,
              "interval": "10s",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "A"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "1-(node_filesystem_free_bytes{instance=~'$instance',fstype=~\"ext4|xfs\"} / node_filesystem_size_bytes{instance=~'$instance',fstype=~\"ext4|xfs\"})",
              "format": "table",
              "hide": false,
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "expr": "",
              "format": "table",
              "interval": "10s",
              "intervalFactor": 1,
              "legendFormat": "",
              "refId": "D"
            }
          ],
          "title": "Free space for each partition",
          "transform": "table",
          "type": "table-old"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "",
          "fieldConfig": {
            "defaults": {
              "color": {
                "mode": "thresholds"
              },
              "mappings": [
                {
                  "options": {
                    "match": "null",
                    "result": {
                      "text": "N/A"
                    }
                  },
                  "type": "special"
                }
              ],
              "thresholds": {
                "mode": "absolute",
                "steps": [
                  {
                    "color": "green",
                    "value": null
                  }
                ]
              },
              "unit": "bytes"
            },
            "overrides": []
          },
          "gridPos": {
            "h": 3,
            "w": 2,
            "x": 2,
            "y": 7
          },
          "id": 69,
          "maxDataPoints": 100,
          "options": {
            "colorMode": "value",
            "graphMode": "none",
            "justifyMode": "auto",
            "orientation": "horizontal",
            "reduceOptions": {
              "calcs": [
                "lastNotNull"
              ],
              "fields": "",
              "values": false
            },
            "showPercentChange": false,
            "text": {},
            "textMode": "auto",
            "wideLayout": true
          },
          "pluginVersion": "10.4.2",
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": false,
              "expr": "node_memory_MemTotal_bytes{instance=~\"$instance\"}",
              "format": "time_series",
              "instant": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{instance}}",
              "refId": "A",
              "step": 20
            }
          ],
          "title": "RAM",
          "type": "stat"
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fieldConfig": {
            "defaults": {
              "links": [],
              "unit": "%"
            },
            "overrides": []
          },
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 11,
            "w": 13,
            "x": 0,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 77,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "max": true,
            "min": true,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:8919",
              "alias": "Load 1m",
              "color": "#8AB8FF",
              "fillGradient": 10
            },
            {
              "$$hashKey": "object:8920",
              "alias": "Load 5m",
              "color": "#FFEE52",
              "fill": 6
            },
            {
              "$$hashKey": "object:8921",
              "alias": "Load 15m",
              "color": "#C4162A",
              "fill": 6
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_load1{instance=~\"$instance\"}*100",
              "format": "time_series",
              "interval": "10s",
              "intervalFactor": 2,
              "legendFormat": "Load 1m",
              "refId": "A",
              "step": 480
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_load5{instance=~\"$instance\"}*100",
              "format": "time_series",
              "interval": "10s",
              "intervalFactor": 2,
              "legendFormat": "Load 5m",
              "refId": "B",
              "step": 480
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_load15{instance=~\"$instance\"}*100",
              "format": "time_series",
              "interval": "10s",
              "intervalFactor": 2,
              "legendFormat": "Load 15m",
              "refId": "C",
              "step": 480
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Avg. System Load",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:8946",
              "decimals": 0,
              "format": "%",
              "label": "Load",
              "logBase": 1,
              "min": "0",
              "show": true
            },
            {
              "$$hashKey": "object:8947",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "alert": {
            "alertRuleTags": {},
            "conditions": [
              {
                "evaluator": {
                  "params": [
                    2
                  ],
                  "type": "gt"
                },
                "operator": {
                  "type": "and"
                },
                "query": {
                  "params": [
                    "E",
                    "5m",
                    "now"
                  ]
                },
                "reducer": {
                  "params": [],
                  "type": "avg"
                },
                "type": "query"
              }
            ],
            "executionErrorState": "alerting",
            "for": "5m",
            "frequency": "1m",
            "handler": 1,
            "message": "Warning, warning!",
            "name": "CPU usage, disk I/O operations per second take time（%） alert",
            "noDataState": "no_data",
            "notifications": []
          },
          "aliasColors": {
            "Disk consumption in I/O operations": "#ba43a9",
            "Idle - Waiting for something to happen": "#052B51",
            "guest": "#9AC48A",
            "idle": "#052B51",
            "iowait": "#EAB839",
            "irq": "#BF1B00",
            "nice": "#C15C17",
            "sdb_% I/O operations per second": "#d683ce",
            "softirq": "#E24D42",
            "steal": "#FCE2DE",
            "system": "#508642",
            "user": "#5195CE"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "decimals": 2,
          "description": "node_disk_io_time_seconds_total：\nThe number of milliseconds the disk spends on input/output operations. This value is the accumulated value.（Milliseconds Spent Doing I/Os）\n\nirate(node_disk_io_time_seconds_total[1m])：\nCalculate the rate per second: (last value - last previous value) / timestamp difference, that is, the percentage of time that the disk spends on I/O operations in 1 second.",
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 11,
            "w": 11,
            "x": 13,
            "y": 10
          },
          "hiddenSeries": false,
          "id": 79,
          "legend": {
            "alignAsTable": true,
            "avg": true,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "maxPerRow": 6,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "avg(irate(node_cpu_seconds_total{instance=~\"$instance\",mode=\"system\"}[1m]))",
              "format": "time_series",
              "instant": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "System",
              "refId": "A",
              "step": 20
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "avg(irate(node_cpu_seconds_total{instance=~\"$instance\",mode=\"user\"}[1m]))",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "User",
              "refId": "B",
              "step": 240
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "avg(irate(node_cpu_seconds_total{instance=~\"$instance\",mode=\"idle\"}[1m]))",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Idle",
              "refId": "F",
              "step": 240
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "avg(irate(node_cpu_seconds_total{instance=~\"$instance\",mode=\"iowait\"}[1m]))",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "Iowait",
              "refId": "D",
              "step": 240
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_io_time_seconds_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{device}}_% of I/O operations per second",
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "avg(irate(node_cpu_seconds_total{mode=\"system\"}[1m]))",
              "interval": "",
              "legendFormat": "test",
              "refId": "E"
            }
          ],
          "thresholds": [
            {
              "colorMode": "critical",
              "fill": true,
              "line": true,
              "op": "gt",
              "value": 2,
              "visible": true
            }
          ],
          "timeRegions": [],
          "title": "CPU usage, disk I/O operations per second take time（%）",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:3461",
              "format": "percentunit",
              "label": "",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:3462",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "vda_write": "#6ED0E0"
          },
          "bars": true,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Reads completed: Reads per second per disk partition\n\nWrites completed: Number of writes per second per disk partition\n\nIO now Number of input/output requests being processed per disk partition per second",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 0,
            "y": 21
          },
          "height": "300",
          "hiddenSeries": false,
          "id": 81,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": true,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": false,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*_read $/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_reads_completed_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_read",
              "refId": "A",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_writes_completed_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_write",
              "refId": "B",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_disk_io_now{instance=~\"$instance\"}",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{device}}",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk read and write rate（IOPS）",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "iops",
              "label": "Read (-) / write（+）I/O ops/sec",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "vda_write": "#6ED0E0"
          },
          "bars": true,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Read bytes The number of bits read per second per disk partition\nWritten bytes The number of bits written per second per disk partition",
          "fill": 2,
          "fillGradient": 0,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 8,
            "y": 21
          },
          "height": "300",
          "hiddenSeries": false,
          "id": 83,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": true,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": false,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "$$hashKey": "object:7496",
              "alias": "/.*_read $/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_read_bytes_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_read",
              "refId": "A",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_written_bytes_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_write",
              "refId": "B",
              "step": 10
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk read and write capacity",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:7503",
              "format": "Bps",
              "label": "Read (-) / write (+)",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:7504",
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "vda": "#6ED0E0"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "Read time ms Number of seconds per disk partition read operation\n\nWrite time ms Number of seconds spent per disk partition write operation\n\nIO time ms Number of seconds spent per disk partition input/output operation\n\n IO time weighted Weighted seconds spent per disk partition input/output operation",
          "fill": 3,
          "fillGradient": 0,
          "gridPos": {
            "h": 8,
            "w": 8,
            "x": 16,
            "y": 21
          },
          "height": "300",
          "hiddenSeries": false,
          "id": 85,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": true,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "10.4.2",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/,*_read $/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_io_time_seconds_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}",
              "refId": "A",
              "step": 10
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_io_time_weighted_seconds_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": true,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{device}}_weighted",
              "refId": "D"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_read_time_seconds_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{device}}_read",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_disk_write_time_seconds_total{instance=~\"$instance\"}[1m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "{{device}}_write",
              "refId": "C"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Disk IO read and write time",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "s",
              "label": "Read (-) / write (+) ",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {},
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "fill": 1,
          "fillGradient": 0,
          "gridPos": {
            "h": 9,
            "w": 12,
            "x": 0,
            "y": 29
          },
          "height": "300",
          "hiddenSeries": false,
          "id": 87,
          "legend": {
            "alignAsTable": false,
            "avg": false,
            "current": true,
            "hideEmpty": true,
            "hideZero": true,
            "max": false,
            "min": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 2,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "8.4.5",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [
            {
              "alias": "/.*_out upload $/",
              "transform": "negative-Y"
            }
          ],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_network_receive_bytes_total{instance=~'$instance',device!~'tap.*'}[5m])*8",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_in download",
              "refId": "A",
              "step": 4
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_network_transmit_bytes_total{instance=~'$instance',device!~'tap.*'}[5m])*8",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 2,
              "legendFormat": "{{device}}_out upload",
              "refId": "B",
              "step": 4
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "Network traffic",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "format": "bps",
              "label": "Upload (-) / Download（+）",
              "logBase": 1,
              "show": true
            },
            {
              "format": "short",
              "logBase": 1,
              "show": false
            }
          ],
          "yaxis": {
            "align": false
          }
        },
        {
          "aliasColors": {
            "TCP": "#6ED0E0"
          },
          "bars": false,
          "dashLength": 10,
          "dashes": false,
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "description": "CurrEstab - TCP connections with current state ESTABLISHED or CLOSE-WAIT\n\nActiveOpens - TCP average connections that have been converted from CLOSED state to SYN-SENT state (within 1 minute)\n\nPassiveOpens - Directly from LISTEN state The average number of TCP connections to SYN-RCVD state (within 1 minute)\n\nTCP_all oc - the number of TCP sockets allocated (established, applied to sk_buff)\n\nTCP_inuse - in use (listening The number of TCP sockets \n\nTCP_tw - the number of TCP connections waiting to be closed",
          "fill": 0,
          "fillGradient": 0,
          "gridPos": {
            "h": 9,
            "w": 12,
            "x": 12,
            "y": 29
          },
          "height": "300",
          "hiddenSeries": false,
          "id": 89,
          "legend": {
            "alignAsTable": true,
            "avg": false,
            "current": true,
            "max": true,
            "min": false,
            "rightSide": false,
            "show": true,
            "total": false,
            "values": true
          },
          "lines": true,
          "linewidth": 1,
          "nullPointMode": "null",
          "options": {
            "alertThreshold": true
          },
          "paceLength": 10,
          "percentage": false,
          "pluginVersion": "8.4.5",
          "pointradius": 5,
          "points": false,
          "renderer": "flot",
          "seriesOverrides": [],
          "spaceLength": 10,
          "stack": false,
          "steppedLine": false,
          "targets": [
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_netstat_Tcp_CurrEstab{instance=~'$instance'}",
              "format": "time_series",
              "hide": false,
              "interval": "10s",
              "intervalFactor": 1,
              "legendFormat": "ESTABLISHED",
              "refId": "A",
              "step": 20
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_sockstat_TCP_tw{instance=~'$instance'}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_tw",
              "refId": "D"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_netstat_Tcp_ActiveOpens{instance=~'$instance'}[1m])",
              "format": "time_series",
              "hide": false,
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "ActiveOpens",
              "refId": "B"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "irate(node_netstat_Tcp_PassiveOpens{instance=~'$instance'}[1m])",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "PassiveOpens",
              "refId": "C"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_sockstat_TCP_alloc{instance=~'$instance'}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_alloc",
              "refId": "E"
            },
            {
              "datasource": {
                "type": "prometheus",
                "uid": "${DS_PROMETHEUS}"
              },
              "exemplar": true,
              "expr": "node_sockstat_TCP_inuse{instance=~'$instance'}",
              "format": "time_series",
              "interval": "",
              "intervalFactor": 1,
              "legendFormat": "TCP_inuse",
              "refId": "F"
            }
          ],
          "thresholds": [],
          "timeRegions": [],
          "title": "TCP Connection situation",
          "tooltip": {
            "shared": true,
            "sort": 0,
            "value_type": "individual"
          },
          "type": "graph",
          "xaxis": {
            "mode": "time",
            "show": true,
            "values": []
          },
          "yaxes": [
            {
              "$$hashKey": "object:3549",
              "format": "short",
              "logBase": 1,
              "show": true
            },
            {
              "$$hashKey": "object:3550",
              "format": "short",
              "logBase": 1,
              "show": true
            }
          ],
          "yaxis": {
            "align": false
          }
        }
      ],
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "PBFA97CFB590B2093"
          },
          "refId": "A"
        }
      ],
      "title": "Hardware health",
      "type": "row"
    }
  ],
  "refresh": "1m",
  "schemaVersion": 39,
  "tags": [
    "cosmos",
    "blockchain",
    "validator"
  ],
  "templating": {
    "list": [
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(tendermint_consensus_height,job)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "network",
        "options": [],
        "query": {
          "qryType": 1,
          "query": "label_values(tendermint_consensus_height,job)",
          "refId": "PrometheusVariableQueryEditor-VariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(tendermint_consensus_height{job=\"$network\"},chain_id)",
        "hide": 0,
        "includeAll": false,
        "label": "",
        "multi": false,
        "name": "chain_id",
        "options": [],
        "query": {
          "qryType": 1,
          "query": "label_values(tendermint_consensus_height{job=\"$network\"},chain_id)",
          "refId": "PrometheusVariableQueryEditor-VariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(cosmos_validator_status{chain_id=\"$chain_id\"},moniker)",
        "hide": 0,
        "includeAll": false,
        "label": "moniker",
        "multi": false,
        "name": "moniker",
        "options": [],
        "query": {
          "qryType": 1,
          "query": "label_values(cosmos_validator_status{chain_id=\"$chain_id\"},moniker)",
          "refId": "PrometheusVariableQueryEditor-VariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      },
      {
        "current": {},
        "datasource": {
          "type": "prometheus",
          "uid": "${DS_PROMETHEUS}"
        },
        "definition": "label_values(node_memory_MemTotal_bytes, instance)",
        "hide": 0,
        "includeAll": false,
        "multi": false,
        "name": "instance",
        "options": [],
        "query": {
          "query": "label_values(node_memory_MemTotal_bytes, instance)",
          "refId": "StandardVariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "skipUrlSync": false,
        "sort": 0,
        "type": "query"
      }
    ]
  },
  "time": {
    "from": "now-24h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "",
  "title": "Cosmos Validator",
  "uid": "cosmos_validator",
  "version": 13,
  "weekStart": ""
}
resource "grafana_dashboard" "traffic_statistics" {
  folder = grafana_folder.folder1.uid
  config_json = jsonencode({
    "annotations" : {
      "list" : [
        {
          "builtIn" : 1,
          "datasource" : {
            "type" : "datasource",
            "uid" : "grafana"
          },
          "enable" : true,
          "hide" : true,
          "iconColor" : "rgba(0, 211, 255, 1)",
          "name" : "Annotations & Alerts",
          "target" : {
            "limit" : 100,
            "matchAny" : false,
            "tags" : [],
            "type" : "dashboard"
          },
          "type" : "dashboard"
        }
      ]
    },
    "editable" : true,
    "fiscalYearStartMonth" : 0,
    "graphTooltip" : 1,
    "id" : 7,
    "links" : [],
    "liveNow" : false,
    "panels" : [
      {
        "collapsed" : false,
        "gridPos" : {
          "h" : 1,
          "w" : 24,
          "x" : 0,
          "y" : 0
        },
        "id" : 8,
        "panels" : [],
        "title" : "Firewall",
        "type" : "row"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "bps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 0,
          "y" : 1
        },
        "id" : 2,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "table",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.111\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n",
            "refId" : "A"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.111\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n",
            "refId" : "B"
          }
        ],
        "title" : "ge-0/0/0.111 - BeskydNet",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "min" : -5,
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 12,
          "y" : 1
        },
        "id" : 3,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.222\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.222\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/0.222 - Workshop",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "min" : -5,
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : [
            {
              "__systemRef" : "hideSeriesFrom",
              "matcher" : {
                "id" : "byNames",
                "options" : {
                  "mode" : "exclude",
                  "names" : [
                    "ifHCInOctets {agent_host=\"172.31.1.1\", app=\"snmp\", host=\"telegraf-deployment-75f8f96d77-g72rd\", hostname=\"SRX300-A\", ifName=\"ge-0/0/0.333\", name=\"snmp\"}"
                  ],
                  "prefix" : "All except:",
                  "readOnly" : true
                }
              },
              "properties" : [
                {
                  "id" : "custom.hideFrom",
                  "value" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : true
                  }
                }
              ]
            }
          ]
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 0,
          "y" : 11
        },
        "id" : 5,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.333\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.222\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/0.333 - O2 LTE",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 12,
          "y" : 11
        },
        "id" : 16,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/1\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/1\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/1 - Switch D-Link",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 0,
          "y" : 21
        },
        "id" : 17,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/3\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/3\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/3 - Vojtik",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 12,
          "y" : 21
        },
        "id" : 21,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/4\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/4\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/4 - WiFi Germanium-2.4G (upstairs)",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 0,
          "y" : 31
        },
        "id" : 18,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/5\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/5\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/5 - MacBook",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "$datasource"
        },
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green",
                  "value" : null
                },
                {
                  "color" : "red",
                  "value" : 80
                }
              ]
            },
            "unit" : "binbps"
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 10,
          "w" : 12,
          "x" : 12,
          "y" : 31
        },
        "id" : 20,
        "options" : {
          "legend" : {
            "calcs" : [],
            "displayMode" : "list",
            "placement" : "bottom",
            "showLegend" : true
          },
          "tooltip" : {
            "maxHeight" : 600,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/7\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "B"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "hide" : false,
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/7\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
            "refId" : "C"
          }
        ],
        "title" : "ge-0/0/7 - Xerox printer",
        "type" : "timeseries"
      },
      {
        "collapsed" : true,
        "gridPos" : {
          "h" : 1,
          "w" : 24,
          "x" : 0,
          "y" : 41
        },
        "id" : 9,
        "panels" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "min" : -5,
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 0,
              "y" : 2
            },
            "id" : 6,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"1\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"1\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 1, Uplink to SRX",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 6,
              "y" : 2
            },
            "id" : 7,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"2\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"2\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 2, WiFi",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 12,
              "y" : 2
            },
            "id" : 10,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"3\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"3\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 3, TV Samsung",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 18,
              "y" : 2
            },
            "id" : 11,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"4\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"4\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 4, orange2",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "min" : -5,
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 0,
              "y" : 12
            },
            "id" : 12,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"5\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"5\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 5, orange3",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "min" : -5,
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 6,
              "y" : 12
            },
            "id" : 13,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"6\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"6\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 6, orange1",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "min" : -5,
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 12,
              "y" : 12
            },
            "id" : 14,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"7\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"7\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 7",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "$datasource"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "min" : -5,
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "binbps",
                "unitScale" : true
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 10,
              "w" : 6,
              "x" : 18,
              "y" : 12
            },
            "id" : 15,
            "options" : {
              "legend" : {
                "calcs" : [],
                "displayMode" : "list",
                "placement" : "bottom",
                "showLegend" : true
              },
              "tooltip" : {
                "mode" : "single",
                "sort" : "none"
              }
            },
            "targets" : [
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCInOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"8\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "B"
              },
              {
                "datasource" : {
                  "type" : "influxdb",
                  "uid" : "$datasource"
                },
                "hide" : false,
                "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.197\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"ifIndex\"] == \"8\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
                "refId" : "C"
              }
            ],
            "title" : "SWITCH - Port 8, NAS Synology",
            "type" : "timeseries"
          }
        ],
        "title" : "Switch",
        "type" : "row"
      }
    ],
    "refresh" : false,
    "schemaVersion" : 39,
    "tags" : [],
    "templating" : {
      "list" : [
        {
          "current" : {
            "selected" : true,
            "text" : "influxdb-apollo-terraform",
            "value" : "adg0kuh36f37kd"
          },
          "hide" : 0,
          "includeAll" : false,
          "label" : "Datasource",
          "multi" : false,
          "name" : "datasource",
          "options" : [],
          "query" : "influxdb",
          "queryValue" : "",
          "refresh" : 1,
          "regex" : "/^influxdb/",
          "skipUrlSync" : false,
          "type" : "datasource"
        }
      ]
    },
    "time" : {
      "from" : "now-6h",
      "to" : "now"
    },
    "timeRangeUpdatedDuringEditOrView" : false,
    "timepicker" : {},
    "timezone" : "",
    "title" : "Traffic statistics",
    "uid" : "traffic-stats",
    "version" : 1,
    "weekStart" : ""
  })
}

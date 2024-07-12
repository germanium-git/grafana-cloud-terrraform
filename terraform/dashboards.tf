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
          "overrides" : []
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
            "query" : "from(bucket: \"Network\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"mem\" or r[\"_measurement\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"ifHCOutOctets\")\r\n  |> filter(fn: (r) => r[\"agent_host\"] == \"172.31.1.1\")\r\n  |> filter(fn: (r) => r[\"app\"] == \"snmp\")\r\n  |> filter(fn: (r) => r[\"hostname\"] == \"SRX300-A\")\r\n  |> filter(fn: (r) => r[\"ifName\"] == \"ge-0/0/0.333\")\r\n  |> map(fn: (r) => ({ r with _value: r._value * 8 }))\r\n  |> derivative(unit: 1s, nonNegative: false)\r\n  |> yield(name: \"derivative\" )\r\n  \r\n",
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

resource "grafana_dashboard" "teltonika_lte" {
  folder = grafana_folder.folder1.uid
  config_json = jsonencode({
    "annotations" : {
      "list" : [
        {
          "builtIn" : 1,
          "datasource" : {
            "type" : "grafana",
            "uid" : "-- Grafana --"
          },
          "enable" : true,
          "hide" : true,
          "iconColor" : "rgba(0, 211, 255, 1)",
          "name" : "Annotations & Alerts",
          "type" : "dashboard"
        }
      ]
    },
    "editable" : true,
    "fiscalYearStartMonth" : 0,
    "graphTooltip" : 0,
    "id" : 24,
    "links" : [],
    "liveNow" : false,
    "panels" : [
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
        },
        "description" : "SINR (The signal-to-noise ratio) value in dB.\n* more than 21 dB - very good\n* from 13 dB to 20 dB - good\n* from 0 dB do 12 dB - bad, an external antenna is needed.\n* less than 0 dB – very poor conditions, an external antenna is needed.",
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
              "barWidthFactor" : 0.6,
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 8,
          "w" : 12,
          "x" : 0,
          "y" : 0
        },
        "id" : 1,
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
              "uid" : "11e7VrHnk"
            },
            "query" : "from(bucket: \"Network\")\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\n  |> filter(fn: (r) => r[\"_field\"] == \"mSINR\")\n  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)\n  |> yield(name: \"last\")",
            "refId" : "A"
          }
        ],
        "title" : "mSINR",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
        },
        "description" : "Signal strength level",
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
              "barWidthFactor" : 0.6,
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 8,
          "w" : 12,
          "x" : 12,
          "y" : 0
        },
        "id" : 2,
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
              "uid" : "11e7VrHnk"
            },
            "query" : "from(bucket: \"Network\")\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\n  |> filter(fn: (r) => r[\"_field\"] == \"mSignal\")\n  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)\n  |> yield(name: \"last\")",
            "refId" : "A"
          }
        ],
        "title" : "mSignal",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
        },
        "description" : "RSRP (Reference Signal Receive Power) value in dBm\n* more than -79 dBm - very good signal\n* from -80 dBm to -90 dBm - good signal\n* from -91 dBm to -100 dBm - weak signal, an external antenna is recommended or a better position of the modem is needed.\n* less than -100 dBm - very poor signal, an external antenna is needed.",
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
              "barWidthFactor" : 0.6,
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
            "max" : -70,
            "min" : -110,
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 8,
          "w" : 12,
          "x" : 0,
          "y" : 8
        },
        "id" : 4,
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
              "uid" : "11e7VrHnk"
            },
            "query" : "from(bucket: \"Network\")\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\n  |> filter(fn: (r) => r[\"_field\"] == \"mRSRP\")\n  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)\n  |> yield(name: \"last\")",
            "refId" : "A"
          }
        ],
        "title" : "mRSRP",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
        },
        "description" : "RSRQ (Reference Signal Receive Quality) value in dB\nRSRQ – Indicates quality of the received signal, and its range is typically -19.5dB(bad) to -3dB (good).\n* more than -9 dB - very good\n* from -10 dB to -15 dB - good\n* form -16 dB to -20 dB - bad, an external antenna is needed or a better position of the modem.\n* less than -20 dB – very bad, an external antenna is needed.",
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
              "barWidthFactor" : 0.6,
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 8,
          "w" : 12,
          "x" : 12,
          "y" : 8
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
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "11e7VrHnk"
            },
            "query" : "from(bucket: \"Network\")\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\n  |> filter(fn: (r) => r[\"_field\"] == \"mRSRQ\")\n  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)\n  |> yield(name: \"last\")",
            "refId" : "A"
          }
        ],
        "title" : "mRSRQ",
        "type" : "timeseries"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
        },
        "description" : "Cell ID",
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "thresholds"
            },
            "custom" : {
              "fillOpacity" : 35,
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineWidth" : 1,
              "spanNulls" : false
            },
            "displayName" : "CellID",
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 7,
          "w" : 24,
          "x" : 0,
          "y" : 16
        },
        "id" : 6,
        "options" : {
          "alignValue" : "center",
          "legend" : {
            "displayMode" : "table",
            "placement" : "bottom",
            "showLegend" : false
          },
          "mergeValues" : true,
          "rowHeight" : 0.89,
          "showValue" : "auto",
          "tooltip" : {
            "mode" : "none",
            "sort" : "none"
          }
        },
        "pluginVersion" : "10.2.0-60139",
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "11e7VrHnk"
            },
            "query" : "from(bucket: \"Network\")\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\n  |> filter(fn: (r) => r[\"_field\"] == \"mCellID\")\n  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)\n  |> yield(name: \"last\")",
            "refId" : "A"
          }
        ],
        "title" : "mCellID",
        "type" : "state-timeline"
      },
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
        },
        "description" : "Modem's temperature in 0.1 degrees Celsius",
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "axisShow" : false,
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 8,
          "w" : 5,
          "x" : 0,
          "y" : 23
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
            "mode" : "single",
            "sort" : "none"
          }
        },
        "targets" : [
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "11e7VrHnk"
            },
            "query" : "from(bucket: \"Network\")\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\n  |> filter(fn: (r) => r[\"_field\"] == \"mTemperature\")\n  |> aggregateWindow(every: v.windowPeriod, fn: last, createEmpty: false)\n  |> yield(name: \"last\")",
            "refId" : "A"
          }
        ],
        "title" : "mTemperature",
        "type" : "timeseries"
      }
    ],
    "refresh" : "",
    "schemaVersion" : 39,
    "tags" : [],
    "templating" : {
      "list" : []
    },
    "time" : {
      "from" : "now-6h",
      "to" : "now"
    },
    "timepicker" : {},
    "timezone" : "",
    "title" : "Teltonika LTE",
    "uid" : "teltonika-lte",
    "version" : 1,
    "weekStart" : ""
  })
}

resource "grafana_dashboard" "temperature" {
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
    "graphTooltip" : 0,
    "id" : 8,
    "links" : [],
    "liveNow" : false,
    "panels" : [
      {
        "datasource" : {
          "type" : "influxdb",
          "uid" : "11e7VrHnk"
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
              "barWidthFactor" : 0.6,
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
            }
          },
          "overrides" : []
        },
        "gridPos" : {
          "h" : 14,
          "w" : 24,
          "x" : 0,
          "y" : 0
        },
        "id" : 2,
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
              "uid" : "11e7VrHnk"
            },
            "hide" : false,
            "query" : "from(bucket: \"Temperature\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"tmp_in\" or r[\"_measurement\"] == \"tmp_out\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"tmp_in\")\r\n  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)\r\n  |> yield(name: \"mean\")",
            "refId" : "A"
          },
          {
            "datasource" : {
              "type" : "influxdb",
              "uid" : "11e7VrHnk"
            },
            "hide" : false,
            "query" : "from(bucket: \"Temperature\")\r\n  |> range(start: v.timeRangeStart, stop: v.timeRangeStop)\r\n  |> filter(fn: (r) => r[\"_measurement\"] == \"tmp_in\" or r[\"_measurement\"] == \"tmp_out\")\r\n  |> filter(fn: (r) => r[\"_field\"] == \"tmp_out\")\r\n  |> aggregateWindow(every: v.windowPeriod, fn: mean, createEmpty: false)\r\n  |> yield(name: \"mean\")",
            "refId" : "B"
          }
        ],
        "title" : "Temperature",
        "type" : "timeseries"
      }
    ],
    "refresh" : "",
    "schemaVersion" : 39,
    "tags" : [],
    "templating" : {
      "list" : []
    },
    "time" : {
      "from" : "now-6h",
      "to" : "now"
    },
    "timepicker" : {},
    "timezone" : "",
    "title" : "Temperature",
    "uid" : "temperature",
    "version" : 1,
    "weekStart" : ""
  })
}

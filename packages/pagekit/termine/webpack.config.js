module.exports = [

    {
        entry: {
            "index" : "./app/views/index.js",
            "id" : "./app/views/id.js",
            "settings": "./app/views/settings.js",
            "link": "./app/components/link.vue",
            "dashboard": "./app/components/dashboard.vue",
            "table" : "./app/components/table.vue"
        },
        output: {
            filename: "./app/bundle/[name].js"
        },
        module: {
            loaders: [
                { test: /\.vue$/, loader: "vue" }
            ]
        }
    }

];

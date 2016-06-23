module.exports = [

    {
        entry: {
            "index" : "./app/views/index.js",
            "settings": "./app/views/settings.js",
            "link": "./app/components/link.vue",
            "dashboard": "./app/components/dashboard.vue"
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

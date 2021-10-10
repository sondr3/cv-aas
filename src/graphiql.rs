pub fn graphiql_source(endpoint: &str) -> String {
    format!(
        r#"
<!DOCTYPE html>
<html>
  <head>
    <style>
      body {{
        height: 100%;
        margin: 0;
        width: 100%;
        overflow: hidden;
      }}

      #graphiql {{
        height: 100vh;
      }}
    </style>
    <script
      crossorigin
      src="https://unpkg.com/react@16/umd/react.development.js"
    ></script>
    <script
      crossorigin
      src="https://unpkg.com/react-dom@16/umd/react-dom.development.js"
    ></script>
    <link rel="stylesheet" href="https://unpkg.com/graphiql/graphiql.min.css" />
  </head>

  <body>
    <div id="graphiql">Loading...</div>
    <script
      src="https://unpkg.com/graphiql/graphiql.min.js"
      type="application/javascript"
    ></script>
    <script>
      function graphQLFetcher(graphQLParams) {{
        return fetch(
          '{endpoint}',
          {{
            method: 'post',
            headers: {{
              Accept: 'application/json',
              'Content-Type': 'application/json',
            }},
            body: JSON.stringify(graphQLParams),
            credentials: 'omit',
          }},
        ).then(function (response) {{
          return response.json().catch(function () {{
            return response.text();
          }});
        }});
      }}

      ReactDOM.render(
        React.createElement(GraphiQL, {{
          fetcher: graphQLFetcher,
          query: "{{\n  hello(language: ENGLISH)\n  resume(language: ENGLISH)\n  me(language: ENGLISH) {{\n    name\n    tagline\n    about\n  }}\n}}\n",
          response: '{{\n  \"data\": {{\n    \"hello\": \"Hello! Welcome to my CV-as-a-service!\",\n    \"me\": {{\n      \"about\": \"I am a passionate and driven full-stack developer with a passion for open-source and strongly typed programming languages. Doing my masters in algorithms at UiB alongside being a part-time developer at IslandGarden. I am a hobby project fanatic, there\'s always one to many project in my head. I care about the student environment at informatics and I\'m active in a host of student run organizations and projects. In my spare time I enjoy long runs, long evenings playing board games and a good beer.\",\n      \"name\": \"Sondre Nilsen\",\n      \"tagline\": \"Algorithms @ UiB | Full stack developer\",\n    }},\n    \"resume\": \"https://cv.eons.io/english\",\n  }}\n}}'
        }}),
        document.getElementById('graphiql'),
      );
    </script>
  </body>
</html> 
    "#,
        endpoint = endpoint
    )
}

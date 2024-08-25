Welcome to airbnb dbt project!

#DATA FLOW PROGRESS
     
![Screenshot 2024-08-25 205131](https://github.com/user-attachments/assets/99253979-eaf3-458e-9153-734e4e8b980d)

In this example config, we tell dbt to build all models in the example/directory as views. 
These settings can be overridden in the individual model files using the `{{ config(...) }}` macro.

```
models:
  dbtlearn:
    +materialized: view
    dim:
      +materialized: table #everything in dim will be materialized as table because these will be accessed often
    src:
      +materialized: ephemeral  
```

Try running the following commands:
- dbt run
- dbt test


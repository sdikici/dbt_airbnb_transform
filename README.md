Welcome to airbnb dbt project!

### Using the starter project


+models:

  dbtlearn:
  
    +materialized: view
    
    dim:
    
      +materialized: table #everything in dim will be materialized as table because these will be accessed often
      
    src:
    
      +materialized: ephemeral

![Screenshot 2024-08-24 114750](https://github.com/user-attachments/assets/ee336fbd-0ed9-4c9f-9827-089f90c32539)


Try running the following commands:
- dbt run
- dbt test


A simple Todo App
Our Simple ToDo App has a clear data flow that ensures data moves consistently through the application:

Data Sources: Data sources are responsible for interacting with external services or databases. They provide raw data to the application.

Repositories: Repositories act as an abstraction layer between data sources and use cases. They decide from which data source to fetch data and handle data transformation.

Use Cases: Use cases contain the business logic of the application. They orchestrate data operations by interacting with repositories. Use cases take raw data and format it for use in the UI.

State Management (BLoC): State management is handled by BLoC (Business Logic Component). BLoC manages the application's state and interacts with use cases to fetch and update data.

Presentation (UI): The user interface is built using Flutter, and it listens to the state managed by BLoC. When the state changes, the UI is updated to reflect the new data.

 Usage
Creating Categories
To organize your tasks, you can create categories. Each category acts as a container for multiple to-do items.

Add a Category: In the app, navigate to the "Categories" section. You can find an "Add Category" button or a plus icon. Click on it.

Enter Category Name: Provide a meaningful name for your category, like "Work," "Personal," or "Groceries." Then, press the "Save" button.

View Categories: You will now see the list of categories you've created. You can click on a category to see its associated to-do items.

Managing To-Do Items
Within each category, you can create multiple to-do items and manage them effortlessly.

Add a To-Do Item: Inside a category, you'll find an "Add To-Do Item" button. Click on it.

Fill in Details: Specify a title for your to-do item. You can also add an optional description if needed. Click "Save" to create the item.

Mark as Complete: When you complete a task, tap on the checkbox next to it. This will mark the task as completed.

Updating a To-Do Item: Long-press on a to-do item to bring up an option to update its title or description. Make your changes and press "Save" to update.

Deleting a To-Do Item: Swipe from left to right on a to-do item. This action will delete the task from the list.

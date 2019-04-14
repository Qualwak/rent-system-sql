[**User**](#user)
  - [registration](#register-user)
  - [authentication](#authenticate-user)
  - [show user info](#show-user)
  - [show current user info](#show-current-user)
  - [show all users](#show-all-users)
  - 
  
  
[**Item**](#item)


# User

**Register User**
----
  Register user and returns json data about a single user.

* **URL**

  /users

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  None
  
* **Body:**

  **Required:**
 
   `name=[string], surname=[string], email=[string], role_id=[integer]`
   
   **Non-required:**
   
   `username=[string], phone=[string]`
   
* **Success Response:**

  * **Code:** 201 <br />
    **Content:** `{ status : "success", data : { "id" : 12, "username" : "tGaripov", "email" : "tgaripov@gmail.com", "name" : "Tagir", "surname" : "Garipov", "phone" : "89179232662", "role_id" : 1, "created_at" : "2019-03-31T05:06:51.758Z", "updated_at" : "2019-03-31T05:06:51.758Z" } }`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{status: "fail", data: { "<field>" : ["can't be blank"] } }`
    
**Authenticate user**
----
  Register user and returns json data about a single user.

* **URL**

  /authenticate

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  None
  
* **Body:**

  **Required:**
 
   `email=[string], password=[string]`
   
   **Non-required:**
   
   None
   
* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ "auth_token" : "<user-token>" }`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{status: "fail", data: { "<field>" : ["can't be blank"] } }`
 
**Show User**
----
  Returns json data about a single user.

* **URL**

  /users/:id

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   `id=[integer]`

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`

* **Body:**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ status: "success", data = { "id" : 12, "username" : "tGaripov", "email" : "tgaripov@gmail.com", "name" : "Tagir", "surname" : "Garipov", "phone" : "89179232662", "role_id" : 1 } }`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "User doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Not Authorized" }` 
 
**Show Current User**
----
  Returns json data about a current user by token.

* **URL**

  /current-user

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   ``

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`

* **Body:**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ "id" : 12, "username" : "tGaripov", "email" : "tgaripov@gmail.com", "name" : "Tagir", "surname" : "Garipov", "phone" : "89179232662", "role_id" : 1 }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Not Authorized" }`

**Show all users**
----
  Return json data about all users.

* **URL**

  /users

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`
 
* **Body:**

  None
   
* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ status: "fail", data: [ { "id" : 12, "username" : "tGaripov", "email" : "tgaripov@gmail.com", "name" : "Tagir", "surname" : "Garipov", "phone" : "89179232662", "role_id" : 1 } ] }`
 
* **Error Response:**

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Not Authorized" }`
 
**Show Items of Current User**
----
  Returns json data about items of current user.

* **URL**

  /my-items 

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`

* **Body:**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ status: "success", data = [] }`

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Not Authorized" }` 
 
**Show Order of Current User (Lessee)**
----
  Returns json data about orders of current user (user is lessee).

* **URL**

  /my-orders/rented

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`

* **Body:**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ status: "success", data = [ { "id" : 12, "item_id" : "4", "user_id" : "7", "duration" : "", "status" : "", "description" : "", "final_price" : "", "lessee_email" : "", "lessee_phone" : "", "lessor_email" : "", "lessor_phone" : "", created_at": "2019-04-02T12:55:10.969Z", "updated_at": "2019-04-02T12:55:28.088Z" }, {...}, ... ] }`

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Not Authorized" }` 
    
  
**Show Order of Current User (Lessor)**
----
  Returns json data about orders of current user (user is lessor).

* **URL**

  /my-orders/rent

* **Method:**

  `GET`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`

* **Body:**

  None

* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ status: "success", data = [ { "id" : 12, "item_id" : "", "user_id" : "", "duration" : "", "status" : "", "description" : "", "final_price" : "", "lessee_email" : "", "lessee_phone" : "", "lessor_email" : "", "lessor_phone" : "", created_at": "2019-04-02T12:55:10.969Z", "updated_at": "2019-04-02T12:55:28.088Z" }, {...}, ... ] }`

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "Not Authorized" }` 

# Item

**Add Item**
----
  Add new item and returns json data about a single item.

* **URL**

  /items

* **Method:**

  `POST`
  
*  **URL Params**

   **Required:**
 
   None

* **Headers:**

  * **Key:** `Authorization`
    **Value:** `<your token>`
  
* **Body:**

  **Required:**
 
   `user_id=[integer], title=[string], description=[string], price=[string], duration=[integer], subcategory_id=[integer]`
   
   **Non-required:**
   
   None
   
* **Success Response:**

  * **Code:** 201 <br />
    **Content:** `{ status : "success", data : { "id" : 12, "duration" : 3, "price" : "400", "user_id" : 12, "subcategory_id" : 3, "title" : "Best laptop ever", "description" : "the best in the whole world", "created_at": "2019-04-02T12:55:10.969Z", "updated_at": "2019-04-02T12:55:28.088Z" } }`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{status: "fail", data: { "<field>" : ["can't be blank"] } }`


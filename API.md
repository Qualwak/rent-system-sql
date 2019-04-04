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
    **Content:** `{status: "fail", data: { "email" : ["can't be blank"] } }`
    
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
    **Content:** `{status: "fail", data: { "email" : ["can't be blank"] } }`
 
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
    **Content:** `{ "id" : 12, "username" : "tGaripov", "email" : "tgaripov@gmail.com", "name" : "Tagir", "surname" : "Garipov", "phone" : "89179232662", "role_id" : 1 }`
 
* **Error Response:**

  * **Code:** 422 UNPROCESSABLE ENTITY <br />
    **Content:** `{ status: "fail", data: { email: ["can't be blank"] } }`

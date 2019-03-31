# User

** Register user **

* URL:
/users/
* Method:
```
POST
```
* URL Params:
- Required:

- Non-required:

* Data Params:

* Success Response:
- **Code:** 201
  **Content:** 
* Error Response:

* Sample Call:

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
    **Content:** `{ id : 12, username : "tGaripov", email : "tgaripov@gmail.com", name : "Tagir", surname : "Garipov", phone : "89179232662", role_id : 1 }`
 
* **Error Response:**

  * **Code:** 404 NOT FOUND <br />
    **Content:** `{ error : "User doesn't exist" }`

  OR

  * **Code:** 401 UNAUTHORIZED <br />
    **Content:** `{ error : "You are unauthorized to make this request." }`

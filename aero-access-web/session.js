export function saveSession(user){

    localStorage.setItem(
        "user",
        JSON.stringify(user)
    );
}

export function getSession(){

    return JSON.parse(
        localStorage.getItem("user")
    );
}

export function logout(){

    localStorage.removeItem("user");

    location.href =
        "login.html";
}
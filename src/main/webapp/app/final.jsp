<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Game is over!</title>
</head>
<body>
<div id="winner" class="w3-hide">
    <h1>you are the winner</h1>
</div>
<div id="looser" class="w3-hide">
    <h1>sorry, you lost this game</h1>
</div>

<button type="button" onclick="logout()">Exit</button>
<button type="button" onclick="startGame()">Start New Game</button>

<script>
    /*
    function checkWinner() {
        console.log("checking status");
        fetch("<c:url value='/api/game/status'/>", {
            "method": "GET",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }.,
            

            if (game.playerActive){
                document.getElementById("looser").classList.remove("w3-hide");
                document.getElementById("winner").classList.add("w3-hide");

            } else {
                document.getElementById("looser").classList.add("w3-hide");
                document.getElementById("winner").classList.remove("w3-hide");
             window.setTimeout(function() {checkStatus();}, 1000);  }

            }
             */
    /*
    function checkStatus() {
        console.log("checking status");
        fetch("<c:url value='/api/game/status'/>", {
            "method": "GET",
            headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
            }
        }).then(function (response) {
            return response.json();
        }).then(function (game) {
            console.log(JSON.stringify(game));
            if (game.status === "PLACEMENT" && game.playerActive) {
                document.getElementById("looser").classList.remove("w3-hide");
                document.getElementById("winner").classList.add("w3-hide");

            } else {
                document.getElementById("looser").classList.add("w3-hide");
                document.getElementById("winner").classList.remove("w3-hide");
                window.setTimeout(function() {checkStatus();}, 1000);
            }
        });
        */

    function logout() {
        fetch("<c:url value='/api/auth/logout'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/";
            });
    }

    function startGame() {
        fetch("<c:url value='/api/game'/>", {"method": "POST"})
            .then(function (response) {
                location.href = "/app/placement.jsp";
            });
    }



</script>
</body>
</html>

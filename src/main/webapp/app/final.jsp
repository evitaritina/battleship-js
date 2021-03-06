


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <title>Game is over</title>
</head>
<body onload="checkStatus()">
<div id="winner" class="w3-hide">
    <h1>you are the winner</h1>
</div>
<div id="looser" class="w3-hide">
    <h1>sorry, you lost this game</h1>
</div>
<button type="button" onclick="logout()">Exit</button>
<button type="button" onclick="startGame()">Start New Game</button>
<button type="button" onclick="startGame()">Player TOP 10</button>

<script>

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
            if (game.status === "FINISHED" && game.playerActive) {
                document.getElementById("winner").classList.remove("w3-hide");
                document.getElementById("looser").classList.add("w3-hide");

            } else {
                document.getElementById("winner").classList.add("w3-hide");
                document.getElementById("looser").classList.remove("w3-hide");
                window.setTimeout(function() {checkStatus();}, 1000);
            }
        });
    }
</script>
</body>
</html>
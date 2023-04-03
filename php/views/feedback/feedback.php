<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulário de feedback</title>
    <!-- Adiciona o CSS do Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h1>Formulário Fedback</h1>
    <form action="/feedback" method="post" >
        <div class="form-group">
            <label>
                Nome
                <input type="text" class="form-control" name="name"  placeholder="Digite seu nome" value="<?=$feedback['name']?>" >
            </label>
        </div>
        <div class="form-group">
            <label>
                Email
                <input type="text" class="form-control" name="email" placeholder="Digite seu email" value="<?=$feedback['email']?>" >
            </label>
            <p class="text-danger"><?=$error['email']?></p>
        </div>
        <div class="form-group">
            <label>
                Feddback
                <input type="text"  class="form-control" name="feedback"  placeholder="Digite seu feedback" value="<?=$feedback['feedback']?>">
            </label>
        </div>
        <input type="submit" value="Enviar" class="btn btn-primary" >
    </form>
</div>

<!-- Adiciona o JavaScript do Bootstrap -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

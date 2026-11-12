<?php
require_once __DIR__.'/../config/bootstrap.php';$id=(int)($_GET['id']??0);try{$s=$pdo->prepare('DELETE FROM addresses WHERE id=?');$s->execute([$id]);flash('success','Endereço excluído.');}catch(PDOException $e){flash('danger','Não é possível excluir: o endereço está vinculado a um frete.');}redirect('addresses/index.php');

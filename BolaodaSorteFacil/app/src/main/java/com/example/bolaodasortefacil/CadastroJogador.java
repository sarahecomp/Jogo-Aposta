package com.example.bolaodasortefacil;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;

import com.example.bolaodasortefacil.model.Servidor;
import com.example.bolaodasortefacil.view.Aposta;

import java.io.IOException;

public class CadastroJogador extends AppCompatActivity {

    private EditText telefone;
    private EditText nome;
    private String resultado;
    private TextView eCadastro;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cadastro_jogador);

        telefone = (EditText)findViewById(R.id.ed_telefone);
        nome = (EditText)findViewById(R.id.ed_nome);
        eCadastro = (TextView) findViewById(R.id.tverro_CadastroJogador);

    }

    public void cadastra(View view){
        if(!checkNome() | !checkTelefone()){
            return;
        }

        Cadastro c = new Cadastro();
        c.execute(telefone.getText().toString(), nome.getText().toString());

        while(resultado==null){}

        if(resultado.equals("erro")){
            eCadastro.setText("Telefone já está cadastrado");
            eCadastro.setVisibility(View.VISIBLE);

        } else if (resultado.equals("401")) {
            eCadastro.setText("Falha ao se comunicar com o servidor. Verifique sua internet ou tente mais tarde");
            eCadastro.setVisibility(View.VISIBLE);

        } else{
            eCadastro.setVisibility(View.INVISIBLE);

            Intent aposta = new Intent(this, Aposta.class);
            startActivity(aposta);
        }

    }

    public boolean checkNome(){
        String u = nome.getText().toString().trim();

        if(u.isEmpty()){
            nome.setError("Informe o nome");
            return false;
        }else{
            nome.setError(null);
        }

        return true;
    }

    public boolean checkTelefone(){
        String u = telefone.getText().toString().trim();

        if(u.isEmpty()){
            telefone.setError("Informe o telefone");
            return false;

        } else if(u.length()<12){
            telefone.setError("Número incompleto");
            return false;

        }else{
            telefone.setError(null);
        }

        return true;
    }

    private class Cadastro extends AsyncTask<String, Integer, String> {

        private Servidor servidor;

        public Cadastro(){}


        @Override
        protected String doInBackground(String... voids) {
            servidor = new Servidor();
            try {
                servidor.abrirConexao();
                servidor.escreverParaServidor("cadastroJogador");
                servidor.escreverParaServidor(voids[0]); //telefone
                servidor.escreverParaServidor(voids[1]);// nome
                resultado = (String) servidor.lerDoServidor(); // erro
                servidor.fechaConexao();

            } catch (IOException | ClassNotFoundException e) {
                resultado = "401";
            }

            return resultado;
        }


    }
}

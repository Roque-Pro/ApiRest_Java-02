package com.crudjspjava.crudjspjava.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.crudjspjava.crudjspjava.Produto;
import com.mysql.jdbc.PreparedStatement;

public class ProdutoDao {

	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crudjspjava","root", "");
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return con;
	}
	
	
	public static int deletarProduto(Produto p) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("DELETE FROM produto WHERE id=?");
			ps.setInt(1, p.getId());
			status = ps.executeUpdate();
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		
		return status;
	}
	
	public static int salvarProduto(Produto p) {
		int status = 0;
		
		try{
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("INSERT INTO produto (nome, quantidade, observacao) VALUES(?,?,?)");
			ps.setString(1, p.getNome());
			ps.setInt(2, p.getQuantidade());
			ps.setString(3, p.getObservacao());
			status = ps.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return status;
	}
	
	
	public static Produto getRegistroById(int id) {
		Produto produto = null;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM produto WHERE id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setQuantidade(rs.getInt("quantidade"));
				produto.setObservacao(rs.getString("observacao"));
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		
		return produto;
	}
	
	public static int updateProduto(Produto p) {
		int status = 0;
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("UPDATE produto SET nome=?,"
					+ " quantidade = ?, observacao = ? WHERE id = ?" );
			
			ps.setString(1, p.getNome());
			ps.setInt(2, p.getQuantidade());
			ps.setString(3, p.getObservacao());
			ps.setInt(4, p.getId());
			status = ps.executeUpdate();
			
			
		}catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static List<Produto> getAllProdutos(){
		List<Produto> list = new ArrayList<Produto>();
		
		try {
			Connection con = getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM produto");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Produto produto = new Produto();
				produto.setId(rs.getInt("id"));
				produto.setNome(rs.getString("nome"));
				produto.setQuantidade(rs.getInt("quantidade"));
				produto.setObservacao(rs.getString("observacao"));
				list.add(produto);
				
				
			}		
		}catch(Exception e) {
			System.out.println(e);
		}
		return list;
	}
	

}


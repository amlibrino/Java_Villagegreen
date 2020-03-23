/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.afpa.villagegreen;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author h-mid
 */
public class FourniDAO extends dbConnect {

    public FourniDAO() {
    }

    /**
     *
     * @param f
     */
    public void Insert(Fourni f) {
        connexion();

        try {
            /*String url = "jdbc:mysql://localhost:3306/hotel?serverTimezone=UTC";
            Connection con = DriverManager.getConnection(url, "root", "");*/

            PreparedStatement stm = con.prepareStatement("INSERT INTO `fournisseur` (f_nom, f_addr, f_cp, f_ville, f_pays, f_mail, f_tel, f_mobile, f_contact) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

            stm.setString(1, f.getNom());
            stm.setString(2, f.getAdresse());
            stm.setString(3, f.getCp());
            stm.setString(4, f.getVille());
            stm.setInt(5, f.getPays());
            stm.setString(6, f.getMail());
            stm.setString(7, f.getTel());
            stm.setString(8, f.getMobile());
            stm.setString(9, f.getContact());

            stm.executeUpdate();
            stm.close();
        } catch (SQLException e) {
            System.out.println("Error while inserting entity 'client'");
            System.out.println(e.getMessage());
        }
        deconnexion();
    }

    public void Update(Fourni f) {
        connexion();

        try {
            PreparedStatement stm = con.prepareStatement("UPDATE `fournisseur` SET f_nom=?, f_addr=?, f_cp=?, f_ville=?, f_pays=?, f_mail=?, f_tel=?, f_mobile=?, f_contact=? WHERE f_id= ? ");

            stm.setString(1, f.getNom());
            stm.setString(2, f.getAdresse());
            stm.setString(3, f.getCp());
            stm.setString(4, f.getVille());
            stm.setInt(5, f.getPays());
            stm.setString(6, f.getMail());
            stm.setString(7, f.getTel());
            stm.setString(8, f.getMobile());
            stm.setString(9, f.getContact());
// J'ai ajouté ça mais ça ne résout qu'une partie du problème
            stm.setInt(10, f.getId());
            stm.executeUpdate();

            stm.close();

        } catch (SQLException e) {
            System.out.println("Error while inserting entity 'client'");
            System.out.println(e.getMessage());
        }
        deconnexion();

    }

    /**
     *
     * @param id
     */
    public void Delete(int id) {
        connexion();

        try {

            try ( PreparedStatement stm = con.prepareStatement("DELETE FROM `fournisseur` WHERE f_id = ?")) {
                stm.setInt(1, id);

                stm.executeUpdate();
            }

        } catch (SQLException e) {
            System.out.println("Error while inserting entity 'fournisseur'");
            System.out.println(e.getMessage());
        }
        deconnexion();

    }

    public Fourni Find(int id) {
        Fourni f = new Fourni();

        connexion();

        try {

            PreparedStatement stm = con.prepareStatement("SELECT * FROM `fournisseur` WHERE f_id = ?");

            stm.setInt(1, id);

            ResultSet result = stm.executeQuery();

            result.next();
            f.setId(id);
            f.setNom(result.getString("f_nom"));
            f.setAdresse(result.getString("f_adresse"));
            f.setCp(result.getString("f_cp"));
            f.setVille(result.getString("f_ville"));
            f.setPays(result.getInt("f_pays"));
            f.setMail(result.getString("f_mail"));
            f.setTel(result.getString("f_tel"));
            f.setMobile(result.getString("f_mobile"));
            f.setContact(result.getString("f_contact"));

            //System.out.format("%s %s %s %s\n", prenom, nom, ville, adresse);
            stm.close();
            result.close();

        } catch (SQLException e) {
            System.out.println("Error");
            System.out.println(e.getMessage());
        }
        deconnexion();

        return f;
    }

    public List<Fourni> List() {

        List<Fourni> resultat = new ArrayList<Fourni>();
       
        connexion();

        try {

            Statement stm = con.createStatement();

            ResultSet result = stm.executeQuery("SELECT * FROM `fournisseur`");

            while (result.next()) {
                Fourni f = new Fourni();
                f.setId(result.getInt("f_id"));  
                f.setNom(result.getString("f_nom"));
                f.setAdresse(result.getString("f_addr"));
                f.setCp(result.getString("f_cp"));
                f.setVille(result.getString("f_ville"));
                f.setPays(result.getInt("f_pays"));
                f.setMail(result.getString("f_mail"));
                f.setTel(result.getString("f_tel"));
                f.setMobile(result.getString("f_mobile"));
                f.setContact(result.getString("f_contact"));

                resultat.add(f);
            }

            stm.close();
            result.close();

        } catch (SQLException e) {
            System.out.println("Error while reading 'client'");
            System.out.println(e.getMessage());
        }
        deconnexion();

        return resultat;
    }

}

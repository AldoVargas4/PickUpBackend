package com.mycompany.pickupbackend.Modelo;

import com.mycompany.pickupbackend.util.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDao {

    // Método para obtener todos los productos
    public List<Producto> obtenerTodos() {
        List<Producto> productos = new ArrayList<>();
        String query = "SELECT * FROM productos";  // Ajusta el nombre de la tabla y columnas según tu base de datos

        try (Connection connection = Conexion.getConnection(); PreparedStatement pst = connection.prepareStatement(query); ResultSet rs = pst.executeQuery()) {

            while (rs.next()) {
                Producto producto = new Producto(
                        rs.getInt("idProducto"), // Asumiendo que la tabla tiene una columna 'idProducto'
                        rs.getString("nombre"), // Columna 'nombre' de la tabla
                        rs.getString("descripcion"), // Columna 'descripcion'
                        rs.getDouble("precio"), // Columna 'precio'
                        rs.getString("category"), // Columna 'category'
                        rs.getDouble("weight"), // Columna 'weight'
                        rs.getString("countryOrigin"), // Columna 'countryOrigin'
                        rs.getString("quality"), // Columna 'quality'
                        rs.getBoolean("check"), // Columna 'check' (booleano)
                        rs.getDouble("minWeight") // Columna 'minWeight'
                );
                productos.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();  // Maneja adecuadamente la excepción
        }

        return productos;
    }

    // Método para obtener un producto por su ID
    public Producto obtenerPorId(int id) {
        Producto producto = null;
        String query = "SELECT * FROM productos WHERE idProducto = ?";  // Ajusta la consulta SQL

        try (Connection connection = Conexion.getConnection(); PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setInt(1, id);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    producto = new Producto(
                            rs.getInt("idProducto"),
                            rs.getString("nombre"),
                            rs.getString("descripcion"),
                            rs.getDouble("precio"),
                            rs.getString("category"),
                            rs.getDouble("weight"),
                            rs.getString("countryOrigin"),
                            rs.getString("quality"),
                            rs.getBoolean("check"),
                            rs.getDouble("minWeight")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return producto;
    }

    // Método para insertar un nuevo producto
    public boolean insertarProducto(Producto producto) {
        String query = "INSERT INTO productos (nombre, descripcion, precio, category, weight, countryOrigin, quality, check, minWeight) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = Conexion.getConnection(); PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setString(1, producto.getNombre());
            pst.setString(2, producto.getDescripcion());
            pst.setDouble(3, producto.getPrecio());
            pst.setString(4, producto.getCategory());
            pst.setDouble(5, producto.getWeight());
            pst.setString(6, producto.getCountryOrigin());
            pst.setString(7, producto.getQuality());
            pst.setBoolean(8, producto.isCheck());
            pst.setDouble(9, producto.getMinWeight());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;  // Retorna true si la inserción fue exitosa
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para actualizar un producto existente
    public boolean actualizarProducto(Producto producto) {
        String query = "UPDATE productos SET nombre = ?, descripcion = ?, precio = ?, category = ?, weight = ?, countryOrigin = ?, quality = ?, check = ?, minWeight = ? WHERE idProducto = ?";

        try (Connection connection = Conexion.getConnection(); PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setString(1, producto.getNombre());
            pst.setString(2, producto.getDescripcion());
            pst.setDouble(3, producto.getPrecio());
            pst.setString(4, producto.getCategory());
            pst.setDouble(5, producto.getWeight());
            pst.setString(6, producto.getCountryOrigin());
            pst.setString(7, producto.getQuality());
            pst.setBoolean(8, producto.isCheck());
            pst.setDouble(9, producto.getMinWeight());
            pst.setInt(10, producto.getIdProducto());

            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;  // Retorna true si la actualización fue exitosa
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un producto
    public boolean eliminarProducto(int id) {
        String query = "DELETE FROM productos WHERE idProducto = ?";

        try (Connection connection = Conexion.getConnection(); PreparedStatement pst = connection.prepareStatement(query)) {

            pst.setInt(1, id);
            int rowsAffected = pst.executeUpdate();
            return rowsAffected > 0;  // Retorna true si la eliminación fue exitosa
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

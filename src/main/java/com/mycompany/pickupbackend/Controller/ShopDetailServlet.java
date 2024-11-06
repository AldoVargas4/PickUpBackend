package com.mycompany.pickupbackend.Controller;

import com.mycompany.pickupbackend.Modelo.Producto;
import com.mycompany.pickupbackend.Modelo.ProductoDao; // Asegúrate de importar el ProductoDao
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ShopDetailServlet", urlPatterns = {"/ShopDetailServlet"})
public class ShopDetailServlet extends HttpServlet {

    private ProductoDao productoDao;

    @Override
    public void init() throws ServletException {
        // Inicializar ProductoDao
        productoDao = new ProductoDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener el idProducto desde la URL
        String idProductoStr = request.getParameter("idProducto");

        if (idProductoStr != null && !idProductoStr.isEmpty()) {
            // Convertir el idProducto a un número
            try {
                int idProducto = Integer.parseInt(idProductoStr);

                // Obtener los detalles del producto desde la base de datos
                Producto producto = productoDao.obtenerPorId(idProducto);

                if (producto != null) {
                    // Pasar el producto al JSP
                    request.setAttribute("producto", producto);

                    // Redirigir a shop_detail.jsp para mostrar los detalles
                    request.getRequestDispatcher("shop_detail.jsp").forward(request, response);
                } else {
                    // Si no se encuentra el producto, mostrar un error
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Producto no encontrado");
                }
            } catch (NumberFormatException e) {
                // Si el idProducto no es un número válido
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto no válido");
            }
        } else {
            // Si no se proporciona un idProducto en la URL
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto no proporcionado");
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para mostrar los detalles de un producto";
    }
}

package com.mycompany.pickupbackend.Controller;

import com.mycompany.pickupbackend.Modelo.Producto;
import com.mycompany.pickupbackend.Modelo.ProductoDao;  // Asegúrate de importar tu ProductoDao
import com.mycompany.pickupbackend.Modelo.Producto;
import com.mycompany.pickupbackend.Modelo.ProductoDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ShopServlet", urlPatterns = {"/ShopServlet"})
public class ShopServlet extends HttpServlet {

    // El ProductoDao debe ser inicializado aquí
    private ProductoDao productoDao;

    @Override
    public void init() throws ServletException {
        // Inicializas el ProductoDao para usarlo en todo el servlet
        productoDao = new ProductoDao();
    }

    // Método para manejar la solicitud GET y mostrar productos
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener los productos de la base de datos
        List<Producto> productos = productoDao.obtenerTodos();

        // Pasar la lista de productos al JSP
        request.setAttribute("productos", productos);

        // Redirigir a shop.jsp para mostrar los productos
        request.getRequestDispatcher("shop.jsp").forward(request, response);
    }

    // Si quieres manejar POST, puedes agregar una lógica adicional aquí
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica adicional si es necesario, por ejemplo, para agregar productos al carrito
        doGet(request, response);  // Redirige a la lógica GET para mostrar los productos
    }

    @Override
    public String getServletInfo() {
        return "Servlet para manejar la tienda y mostrar productos";
    }
}

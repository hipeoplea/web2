//package filters;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//
//
//@WebFilter("/areaCheck")
//public class AccessFilter implements Filter {
//
//
//    @Override
//    public void init(FilterConfig filterConfig) {
//    }
//
//    @Override
//    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain)
//            throws IOException, ServletException {
//        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        HttpServletResponse response = (HttpServletResponse) servletResponse;
//
//        if (request.getAttribute("controller").equals("true")) {
//            response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
//            return;
//        }
//
//        filterChain.doFilter(request, response);
//
//    }
//
//    @Override
//    public void destroy() {
//    }
//}

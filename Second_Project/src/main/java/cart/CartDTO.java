package cart;

import java.util.Vector;

import product.ProductBean;
import product.ProductDAO;

public class CartDTO {
private Vector<ProductBean> cartlist;
	
	public CartDTO() {
		cartlist = new Vector<ProductBean>();
	} // 생성자
	
	public void addProduct(int pnum) throws Exception {
		ProductDAO pdao = ProductDAO.getInstance();
		ProductBean pb = pdao.getProductByPnum(pnum);
		
		for(int i = 0; i<cartlist.size(); i++) {
			int cPnum = cartlist.get(i).getPnum();
			if(cPnum == pnum) {
				return;
			} 
		}
		
		cartlist.add(pb);
		
	} // addProduct
	
	public Vector<ProductBean> getAllCartProducts(){
		return cartlist;
	}
	
	public void deleteProduct(int pnum) {
		for(ProductBean pb : cartlist) {
			if(pb.getPnum() == pnum) {
					cartlist.removeElement(pb);
					break;
			}
		}
	} // deleteProduct
	
	public void removeAllProducts() {
		cartlist.removeAllElements();
	}
	
}

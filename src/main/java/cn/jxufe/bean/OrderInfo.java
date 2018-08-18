package cn.jxufe.bean;

/**
 * 订单商品类
 * Created by LHM on 2018/8/16.
 */
public class OrderInfo {
    private Integer goodsid;
    private String goodsname;
    private double price;//商品单价
    private double totalprice;


    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
}

package cn.jxufe.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * T_Goods
 * @author 
 */
public class Goods implements Serializable {
    /**
     * 商品id
     */
    private Integer goodsid;

    /**
     * 商品名称
     */
    private String goodsname;

    /**
     * 商品原价
     */
    private Integer originalprice;

    /**
     * 商品售价
     */
    private Integer sellingprice;

    /**
     * 商品库存
     */
    private Integer stock;

    /**
     * 商品描述
     */
    private String description;

    /**
     * 商品类别id
     */
    private Integer typeid;

    /**
     * 成交量
     */
    private Integer transactionnum;

    /**
     * 点赞数
     */
    private Integer likenumber;

    /**
     * 发布人
     */
    private String designer;

    /**
     * 发布时间
     */
    private Date createtime;

    /**
     * 状态（0.下架，1.在售）
     */
    private Integer status;

    /**
     * 评论数量
     */
    private Integer commentnum;

    /**
     * 商品图片
     */
    private String img;

    private static final long serialVersionUID = 1L;

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

    public Integer getOriginalprice() {
        return originalprice;
    }

    public void setOriginalprice(Integer originalprice) {
        this.originalprice = originalprice;
    }

    public Integer getSellingprice() {
        return sellingprice;
    }

    public void setSellingprice(Integer sellingprice) {
        this.sellingprice = sellingprice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public Integer getTransactionnum() {
        return transactionnum;
    }

    public void setTransactionnum(Integer transactionnum) {
        this.transactionnum = transactionnum;
    }

    public Integer getLikenumber() {
        return likenumber;
    }

    public void setLikenumber(Integer likenumber) {
        this.likenumber = likenumber;
    }

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getCommentnum() {
        return commentnum;
    }

    public void setCommentnum(Integer commentnum) {
        this.commentnum = commentnum;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Goods other = (Goods) that;
        return (this.getGoodsid() == null ? other.getGoodsid() == null : this.getGoodsid().equals(other.getGoodsid()))
            && (this.getGoodsname() == null ? other.getGoodsname() == null : this.getGoodsname().equals(other.getGoodsname()))
            && (this.getOriginalprice() == null ? other.getOriginalprice() == null : this.getOriginalprice().equals(other.getOriginalprice()))
            && (this.getSellingprice() == null ? other.getSellingprice() == null : this.getSellingprice().equals(other.getSellingprice()))
            && (this.getStock() == null ? other.getStock() == null : this.getStock().equals(other.getStock()))
            && (this.getDescription() == null ? other.getDescription() == null : this.getDescription().equals(other.getDescription()))
            && (this.getTypeid() == null ? other.getTypeid() == null : this.getTypeid().equals(other.getTypeid()))
            && (this.getTransactionnum() == null ? other.getTransactionnum() == null : this.getTransactionnum().equals(other.getTransactionnum()))
            && (this.getLikenumber() == null ? other.getLikenumber() == null : this.getLikenumber().equals(other.getLikenumber()))
            && (this.getDesigner() == null ? other.getDesigner() == null : this.getDesigner().equals(other.getDesigner()))
            && (this.getCreatetime() == null ? other.getCreatetime() == null : this.getCreatetime().equals(other.getCreatetime()))
            && (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()))
            && (this.getCommentnum() == null ? other.getCommentnum() == null : this.getCommentnum().equals(other.getCommentnum()))
            && (this.getImg() == null ? other.getImg() == null : this.getImg().equals(other.getImg()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getGoodsid() == null) ? 0 : getGoodsid().hashCode());
        result = prime * result + ((getGoodsname() == null) ? 0 : getGoodsname().hashCode());
        result = prime * result + ((getOriginalprice() == null) ? 0 : getOriginalprice().hashCode());
        result = prime * result + ((getSellingprice() == null) ? 0 : getSellingprice().hashCode());
        result = prime * result + ((getStock() == null) ? 0 : getStock().hashCode());
        result = prime * result + ((getDescription() == null) ? 0 : getDescription().hashCode());
        result = prime * result + ((getTypeid() == null) ? 0 : getTypeid().hashCode());
        result = prime * result + ((getTransactionnum() == null) ? 0 : getTransactionnum().hashCode());
        result = prime * result + ((getLikenumber() == null) ? 0 : getLikenumber().hashCode());
        result = prime * result + ((getDesigner() == null) ? 0 : getDesigner().hashCode());
        result = prime * result + ((getCreatetime() == null) ? 0 : getCreatetime().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        result = prime * result + ((getCommentnum() == null) ? 0 : getCommentnum().hashCode());
        result = prime * result + ((getImg() == null) ? 0 : getImg().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", goodsid=").append(goodsid);
        sb.append(", goodsname=").append(goodsname);
        sb.append(", originalprice=").append(originalprice);
        sb.append(", sellingprice=").append(sellingprice);
        sb.append(", stock=").append(stock);
        sb.append(", description=").append(description);
        sb.append(", typeid=").append(typeid);
        sb.append(", transactionnum=").append(transactionnum);
        sb.append(", likenumber=").append(likenumber);
        sb.append(", designer=").append(designer);
        sb.append(", createtime=").append(createtime);
        sb.append(", status=").append(status);
        sb.append(", commentnum=").append(commentnum);
        sb.append(", img=").append(img);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
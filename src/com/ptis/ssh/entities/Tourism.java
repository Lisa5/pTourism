package com.ptis.ssh.entities;

import javax.persistence.Entity;

@Entity
public class Tourism {

	private Integer tourismId;
	private Integer typeId;
	private String tourismTitle;
	private String tourismSubtitle;
	private Float price;
	private Integer tourismPraise;
	private String departurePlace;
	private String destinationPlace;
	private String recommendIntro;
	private String tourismImg;
	private String bookNotice;
	private String costDesc;
	private String packages;
	private Integer tourDays;
	private String tourSpecial;
	private String fit;

	public Integer getTourismId() {
		return tourismId;
	}

	public void setTourismId(Integer tourismId) {
		this.tourismId = tourismId;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getTourismTitle() {
		return tourismTitle;
	}

	public void setTourismTitle(String tourismTitle) {
		this.tourismTitle = tourismTitle;
	}

	public String getTourismSubtitle() {
		return tourismSubtitle;
	}

	public void setTourismSubtitle(String tourismSubtitle) {
		this.tourismSubtitle = tourismSubtitle;
	}

	public Float getPrice() {
		return price;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public String getDeparturePlace() {
		return departurePlace;
	}

	public void setDeparturePlace(String departurePlace) {
		this.departurePlace = departurePlace;
	}

	public String getDestinationPlace() {
		return destinationPlace;
	}

	public void setDestinationPlace(String destinationPlace) {
		this.destinationPlace = destinationPlace;
	}

	public String getRecommendIntro() {
		return recommendIntro;
	}

	public void setRecommendIntro(String recommendIntro) {
		this.recommendIntro = recommendIntro;
	}

	public String getBookNotice() {
		return bookNotice;
	}

	public void setBookNotice(String bookNotice) {
		this.bookNotice = bookNotice;
	}

	public String getCostDesc() {
		return costDesc;
	}

	public void setCostDesc(String costDesc) {
		this.costDesc = costDesc;
	}

	public String getPackages() {
		return packages;
	}

	public void setPackages(String packages) {
		this.packages = packages;
	}

	public Integer getTourDays() {
		return tourDays;
	}

	public void setTourDays(Integer tourDays) {
		this.tourDays = tourDays;
	}

	public String getTourSpecial() {
		return tourSpecial;
	}

	public void setTourSpecial(String tourSpecial) {
		this.tourSpecial = tourSpecial;
	}

	public String getFit() {
		return fit;
	}

	public void setFit(String fit) {
		this.fit = fit;
	}

	public String getTourismImg() {
		return tourismImg;
	}

	public void setTourismImg(String tourismImg) {
		this.tourismImg = tourismImg;
	}

	public Integer getTourismPraise() {
		return tourismPraise;
	}

	public void setTourismPraise(Integer tourismPraise) {
		this.tourismPraise = tourismPraise;
	}

}
package kr.or.ddit.finapi.vo;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class FinMarketAccountVO implements Comparable<FinMarketAccountVO> {
	
	@JsonProperty("STAT_NAME")
	private String statName;
	@JsonProperty("STAT_CODE")
	private String statCode;
	@JsonProperty("GRP_CODE")
	private String grpCode;
	@JsonProperty("GRP_NAME")
	private String grpName;
	@JsonProperty("ITEM_CODE")
	private String itemCode;
	@JsonProperty("ITEM_NAME")
	private String itemName;
	@JsonProperty("P_ITEM_CODE")
	private String pItemCode;
	@JsonProperty("P_ITEM_NAME")
	private String pItemName;
	@JsonProperty("CYCLE")
	private String cycle;
	@JsonProperty("START_TIME")
	private String startTime;
	@JsonProperty("END_TIME")
	private String endTime;
	@JsonProperty("DATA_CNT")
	private String dataCnt;
	@JsonProperty("UNIT_NAME")
	private String unitName;
	@JsonProperty("WEIGHT")
	private String weight;
	
	
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cycle == null) ? 0 : cycle.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		FinMarketAccountVO other = (FinMarketAccountVO) obj;
		if (cycle == null) {
			if (other.cycle != null)
				return false;
		} else if (!cycle.equals(other.cycle))
			return false;
		return true;
	}
	
	public FinMarketAccountVO(String cycle) {
		super();
		this.cycle = cycle;
	}
	
	public FinMarketAccountVO() {
		super();
	}
	
	
	@Override
	public int compareTo(FinMarketAccountVO o) {
		return 0;
	}

	
	
}

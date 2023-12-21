package kr.or.ddit.finapi.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.finapi.dao.ApiDatabaseInsertDAO;
import kr.or.ddit.finapi.vo.BankOptionVO;
import kr.or.ddit.finapi.vo.BankVO;

@Component
public class BankInsertProc {

	/**
	 * API 정보를 가져오기
	 * 
	 * @param <T>
	 * @param <E>
	 * @param baseInfoList
	 * @param options
	 * @param baseInfo
	 * @param option
	 * @param searchContent 서비스명
	 * @param topFinGrpNo   권역코드
	 * @param maxPage
	 */
	public <T, E> void takeBankData(List<T> baseInfoList, List<E> options, Class<T> baseInfo, Class<E> option,
			String searchContent, String topFinGrpNo, int maxPage) {
		try {
			// URL 설정 및 연결
			int pageNo = 1;
			while (pageNo <= maxPage) {
				URL url = new URL("https://finlife.fss.or.kr:443/finlifeapi/" + searchContent
						+ "auth=4e304f8f38f7286c303056d3ca574e62" + "&topFinGrpNo=" + topFinGrpNo + "&pageNo="
						+ pageNo);

				HttpURLConnection connection = (HttpURLConnection) url.openConnection();
				connection.setRequestMethod("GET");

				// JSON 데이터를 map으로 매핑
				ObjectMapper objectMapper = new ObjectMapper();
				Map<String, Object> map = new HashMap<String, Object>();
				map = objectMapper.readValue(connection.getInputStream(), new HashMap().getClass());

				// json의 result로 담겨서 온다
				Map<String, Object> resultMap = (Map<String, Object>) map.get("result");
				// 페이지 최대 갯수를 가져옴
				// result.baseList -> 은행정보
				List<Map<String, Object>> baseList = (List<Map<String, Object>>) resultMap.get("baseList");

				// result.optionList -> 은행 부가 정보
				List<Map<String, Object>> optionList = (List<Map<String, Object>>) resultMap.get("optionList");

				if (baseList == null || baseList.size() == 0) {
					break;
				}
				for (Map<String, Object> baseItem : baseList) {
					T t = objectMapper.convertValue(baseItem, baseInfo);
					baseInfoList.add(t);
				}
				for (Map<String, Object> optionItem : optionList) {
					E e = objectMapper.convertValue(optionItem, option);
					options.add(e);
				}
				pageNo++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

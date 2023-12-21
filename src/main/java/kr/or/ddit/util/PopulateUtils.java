package kr.or.ddit.util;

import java.lang.reflect.InvocationTargetException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.Temporal;
import java.util.Date;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.beanutils.converters.AbstractConverter;
import org.apache.commons.beanutils.converters.DateConverter;
import org.apache.commons.lang3.StringUtils;

public class PopulateUtils {

	public static void populate(Object bean,Map<String, ? extends Object> map) {
//		DateConverter converter = new DateConverter();
//		converter.setPattern("yyyy-MM-dd");
//		ConvertUtils.register(converter, Date.class);
		
		Converter converter = new AbstractConverter() {
			
			@Override
			protected Class<?> getDefaultType() {
				return Temporal.class;
			}
			
			@Override
			protected <T> T convertToType(Class<T> type, Object value) throws Throwable {
				if(value!=null) {
					String target = value.toString();
					if(StringUtils.isNotBlank(target)) {
						return (T)type.getMethod("parse", CharSequence.class).invoke(null, target);
					}else {
						return null;
					}
				}else {
					return null;
				}
				
			}
		};
		
		ConvertUtils.register(converter, LocalDate.class);
		ConvertUtils.register(converter, LocalDateTime.class);
		
		try {
			BeanUtils.populate(bean, map);
		} catch (IllegalAccessException | InvocationTargetException e) {
			throw new RuntimeException(e);
		}
	}

}

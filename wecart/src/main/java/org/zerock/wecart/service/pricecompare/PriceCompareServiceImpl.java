package org.zerock.wecart.service.pricecompare;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.wecart.domain.pricecompare.GoodsVO;
import org.zerock.wecart.exception.ServiceException;
import org.zerock.wecart.mapper.pricecompare.PriceCompareMapper;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@NoArgsConstructor
@Log4j2

@Service
public class PriceCompareServiceImpl implements PriceCompareService {

	private PriceCompareMapper mapper;
	
	@Autowired
	public PriceCompareServiceImpl(PriceCompareMapper mapper) {
		this.mapper = mapper;
	}	//Constructor

	@Transactional
	@Override
	public List<GoodsVO> getList() throws ServiceException {
		log.trace("getList() invoked.");
		
		try {
			return this.mapper.selectAll();
		} catch(Exception e) {
			throw new ServiceException(e);
		} //try-catch
	} //getList

	
	
} //end class








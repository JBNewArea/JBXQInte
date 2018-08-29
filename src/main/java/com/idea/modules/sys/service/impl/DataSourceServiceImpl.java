package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.DataSource;
import com.idea.modules.sys.mapper.DataSourceMapper;
import com.idea.modules.sys.service.IDataSourceService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
 * @Title: 数据源
 * @Description: 数据源
 * @author jeeweb
 * @date 2017-05-10 12:01:57
 * @version V1.0   
 *
 */
@Transactional
@Service("dataSourceService")
public class DataSourceServiceImpl  extends CommonServiceImpl<DataSourceMapper,DataSource> implements  IDataSourceService {

}

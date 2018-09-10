package com.idea.modules.supervise.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.supervise.entity.Supervise;
import com.idea.modules.supervise.mapper.SuperviseMapper;
import com.idea.modules.supervise.service.ISuperviseService;

/**
 * 舆情管理
 * @author Arthur
 *
 */
@Transactional
@Service("superviseService")
public class SuperviseServiceImpl extends CommonServiceImpl<SuperviseMapper,Supervise> implements ISuperviseService{


}

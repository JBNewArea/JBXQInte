package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.DictGroup;
import com.idea.modules.sys.mapper.DictGroupMapper;
import com.idea.modules.sys.service.IDictGroupService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("dictGroupService")
public class DictGroupServiceImpl extends CommonServiceImpl<DictGroupMapper,DictGroup> implements IDictGroupService {
}

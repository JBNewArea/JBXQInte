package com.idea.modules.codegen.service;

import java.util.List;
import com.idea.core.common.service.ICommonService;
import com.idea.modules.codegen.entity.Column;

public interface IColumnService extends ICommonService<Column> {
	List<Column> selectListByTableId(String tableId);
}

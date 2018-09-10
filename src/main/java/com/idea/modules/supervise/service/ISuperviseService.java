package com.idea.modules.supervise.service;
import java.util.List;

import com.idea.core.common.service.ICommonService;
import com.idea.modules.supervise.entity.Supervise;

/**
 * 舆情管理
 * @author Arthur
 *
 */
public interface ISuperviseService  extends ICommonService<Supervise> {
	
	
	public List<Supervise> querySupervisepage();
}

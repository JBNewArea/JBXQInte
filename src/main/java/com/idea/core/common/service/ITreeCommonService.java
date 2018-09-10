package com.idea.core.common.service;

import java.io.Serializable;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;

import com.idea.core.common.entity.tree.TreeNode;
import com.idea.core.query.data.Queryable;

public interface ITreeCommonService<T extends Serializable & TreeNode<ID>, ID extends Serializable>
		extends ICommonService<T> {
	public List<T> selectTreeList(Wrapper<T> wrapper);
    public List<T> selectTreeList(Queryable queryable,Wrapper<T> wrapper);
}
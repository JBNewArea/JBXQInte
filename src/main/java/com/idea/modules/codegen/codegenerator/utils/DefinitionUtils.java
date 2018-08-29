package com.idea.modules.codegen.codegenerator.utils;

import com.idea.core.mapper.JaxbMapper;
import com.idea.modules.codegen.codegenerator.xml.definition.Definition;

public class DefinitionUtils {
	public static DefinitionUtils definitionUtils = null;
	public Definition definition = null;

	public static DefinitionUtils getDefinitionUtils() {
		if (definitionUtils == null) {
			definitionUtils = new DefinitionUtils();
		}
		return definitionUtils;
	}

	public Definition getDefinition() {
		return definition;
	}

	public DefinitionUtils() {
		String dbType = CodeGenUtils.getDbType().toLowerCase();
		definition = JaxbMapper.fromLocation("codegen/mapper/" + dbType + "_definition.xml", Definition.class);
	}
}

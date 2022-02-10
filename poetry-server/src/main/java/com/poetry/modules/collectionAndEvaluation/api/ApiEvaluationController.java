package com.poetry.modules.collectionAndEvaluation.api;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.poetry.common.annotation.AuthIgnore;
import com.poetry.common.utils.R;
import com.poetry.modules.collectionAndEvaluation.entity.EvaluationEntity;
import com.poetry.modules.collectionAndEvaluation.service.EvaluationService;

/**
 * 评价留言
 * @author lzl
 *
 */
@RestController
@RequestMapping("/api/order/evaluation")
public class ApiEvaluationController {
	
	@Autowired
	private EvaluationService evaluationService;
	
	@AuthIgnore
    @GetMapping("list")
	public R list(@RequestParam Map<String, Object> map) {
		List<EvaluationEntity> evaluations = evaluationService.queryList(map);
		return R.ok().put("evaluations", evaluations);
	}
	
	@PostMapping("save")
	public R save(@RequestAttribute("userId") Long userId, @RequestBody EvaluationEntity evaluation) {
		evaluation.setCreateTime(new Date());
		evaluation.setMemberId(userId);
		evaluationService.save(evaluation);
		return R.ok();
	}
}

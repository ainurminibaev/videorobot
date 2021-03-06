package com.globaltec.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.globaltec.dao.RecordDao;
import com.globaltec.model.Record;


public interface VideoRecordingManager extends GenericManager {
	
	public Record startRecording(List<String> cameraIdList, Long recordId) throws Exception;	
	
	public boolean stopRecording();
	
	public Record get(Long recordId);
	
	public List<Record> getActiveRecords();

}

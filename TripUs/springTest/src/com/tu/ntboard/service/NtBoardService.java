package com.tu.ntboard.service;

import java.util.List;
import com.tu.ntboard.vo.NtBoardVo;

public interface NtBoardService {
	List<NtBoardVo> ntBoardList(NtBoardVo ntvo);
	public int ntBoardInsert(NtBoardVo ntvo);
	public NtBoardVo ntBoardDetail(NtBoardVo ntvo);
	public int ntBoardUpdate(NtBoardVo ntvo);
	public int ntBoardDelete(NtBoardVo ntvo);
	public int ntBoardListCnt(NtBoardVo ntvo);
	public int ntUpdateViewCnt(NtBoardVo ntvo);
}

package kr.co.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.service.AdminService;
import kr.co.util.UploadFileUtils;
import kr.co.vo.BouquetdetailVO;
import kr.co.vo.CategoryVO;
import kr.co.vo.DressdetailVO;
import kr.co.vo.GoodsVO;
import kr.co.vo.GoodsViewVO;
import kr.co.vo.HairMakeupdetailVO;
import kr.co.vo.HanbokdetailVO;
import kr.co.vo.InvitationdetailVO;
import kr.co.vo.MendressdetailVO;
import kr.co.vo.OrderListVO;
import kr.co.vo.OrderVO;
import kr.co.vo.SnapshotDvddetailVO;
import kr.co.vo.StudiodetailVO;
import kr.co.vo.WeddinghalldetailVO;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	AdminService adminService;

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 관리자화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void getIndex() throws Exception {
		logger.info("get index");
	}

	// 상세웨딩
	@RequestMapping(value = "/goods/details/weddinghalldetail", method = RequestMethod.GET)
	public void getWeddingdetail() throws Exception {
		logger.info("get weddingdetail");
	}

	// 상세드레스
	@RequestMapping(value = "/goods/details/dressdetail", method = RequestMethod.GET)
	public void getDressdetail() throws Exception {
		logger.info("get Dressdetail");
	}

	// 상세메이크업
	@RequestMapping(value = "/goods/details/hair_makeup_detail", method = RequestMethod.GET)
	public void getHairMakeupdetail() throws Exception {
		logger.info("get HairMakeupdetail");
	}

	// 상세스튜디오
	@RequestMapping(value = "/goods/details/studiodetail", method = RequestMethod.GET)
	public void getStudio() throws Exception {
		logger.info("get Studio");
	}

	// 상세스냅샷/DVD
	@RequestMapping(value = "/goods/details/snapshot_dvd_detail", method = RequestMethod.GET)
	public void getSanpshotDvddetail() throws Exception {
		logger.info("get SanpshotDvddetail");
	}

	// 상세예복
	@RequestMapping(value = "/goods/details/mendressdetail", method = RequestMethod.GET)
	public void getMendressdetail() throws Exception {
		logger.info("get Mendressdetail");
	}

	// 상세한복
	@RequestMapping(value = "/goods/details/hanbokdetail", method = RequestMethod.GET)
	public void getHanbokdetail() throws Exception {
		logger.info("get Hanbokdetail");
	}

	// 상세부케
	@RequestMapping(value = "/goods/details/bouquetdetail", method = RequestMethod.GET)
	public void getBouquetdetail() throws Exception {
		logger.info("get getBouquetdetail");
	}

	// 상세청첩장
	@RequestMapping(value = "/goods/details/invitdetail", method = RequestMethod.GET)
	public void getInvitdetail() throws Exception {
		logger.info("get Invitdetail");
	}

	// 상품 등록
	@RequestMapping(value = "/goods/register2", method = RequestMethod.GET)
	public void getGoodsRegister(Model model) throws Exception {
		logger.info("get goods register2");

		List<CategoryVO> category = null; // CatagoryVO 형태의 List형 변수 category 선언
		category = adminService.category(); // DB에 저장된 카테고리를 가져와서 category에 저장

		model.addAttribute("category", JSONArray.fromObject(category)); // 변수 category를 제이슨(json)타입으로 변환하여 category 세션에
																		// 부여
		System.out.println("category :" + category.toString());
	}

	/*
	 * @RequestMapping(value = "/goods/register") public String insertWarn(GoodsVO
	 * vo, HttpSession session,
	 * 
	 * @ModelAttribute("file") MultipartFile file) {
	 * 
	 * 
	 * try {
	 * 
	 * String imgUploadPath = uploadPath + File.separator + "imgUpload"; String
	 * ymdPath = UploadFileUtils.calcPath(imgUploadPath); String fileName = null;
	 * 
	 * if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
	 * fileName = UploadFileUtils.fileUpload(imgUploadPath,
	 * file.getOriginalFilename(), file.getBytes(), ymdPath); } else { fileName =
	 * uploadPath + File.separator + "images" + File.separator + "none.png"; }
	 * 
	 * vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator +
	 * fileName); vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath +
	 * File.separator + "s" + File.separator + "s_" + fileName);
	 * 
	 * System.out.println("vo = " + vo.getGdsName()); System.out.println("vo = " +
	 * vo.getGdsImg());
	 * 
	 * adminService.register(vo);
	 * 
	 * 
	 * } catch (Exception e) {
	 * 
	 * }
	 * 
	 * return "redirect:/admin/index";
	 * 
	 * }
	 */

	// 상품 등록
	@RequestMapping(value = "/goods/register2", method = RequestMethod.POST)
	public String postGoodsRegister(GoodsVO vo, WeddinghalldetailVO weddingvo, DressdetailVO dressvo,
			HairMakeupdetailVO handmvo, StudiodetailVO studiovo, SnapshotDvddetailVO snapshotdvdvo,
			MendressdetailVO mendressvo, HanbokdetailVO hanbokvo, BouquetdetailVO bouquetvo, InvitationdetailVO invitvo,
			MultipartFile file, Model model) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload"; // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath); // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null; // 기본 경로와 별개로 작성되는 경로 + 파일이름

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none1.jpg";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}

		System.out.println("=================");

		System.out.println("1 = " + vo.getGdsName());
		System.out.println("1 = " + vo.getGdsPrice());
		System.out.println("1 = " + vo.getGdsDes());
		System.out.println("1 = " + vo.getGdsImg());
		System.out.println("=================");

		adminService.register2(vo);

//		model.addAttribute("goodsvo", goodsvo);
		System.out.println(vo.toString());
		String detail = vo.getCateCode();
		try {
			switch (detail) {
			case "101":
			adminService.weddingdetail(weddingvo);
				break;
			case "102":
				adminService.dressdetail(dressvo);
				break;
			case "103":
				adminService.handmdetail(handmvo);
				break;
			case "104":
				adminService.studiodetail(studiovo);
				break;
			case "105":
				adminService.snapDvdDetail(snapshotdvdvo);
				break;
			case "106":
				adminService.mendressdetail(mendressvo);
				break;
			case "107":
				adminService.hanbokdetail(hanbokvo);
				break;
			case "108":
				adminService.boquetdetail(bouquetvo);
				break;
			case "109":
				adminService.invitdetail(invitvo);
				break;
			default:
				return "/";

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/admin/index";
	}

	// 상품 목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void getGoodsList(Model model) throws Exception {
		logger.info("get goods list");

		List<GoodsViewVO> list = adminService.goodslist(); // GoodsVO형태의 List형 변수 list 선언

		model.addAttribute("list", list); // 변수 list의 값을 list 세션에 부여
	}

	// 상품 조회
	@RequestMapping(value = "/goods/view", method = RequestMethod.GET)
	public void getGoodsview(@RequestParam("n") int gdsNum, Model model) throws Exception {
		logger.info("get goods view");

		GoodsViewVO goods = adminService.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		System.out.println(goods.toString());
		String detail = goods.getCateCode();
		try {
			switch (detail) {
			case "101":
				WeddinghalldetailVO weddingvo = adminService.weddingView(gdsNum);
				model.addAttribute("weddingvo", weddingvo);
				break;
			case "102":
				DressdetailVO dressvo = adminService.dressView(gdsNum);
				model.addAttribute("dressvo", dressvo);
				break;
			case "103":
				HairMakeupdetailVO hairmakeupvo = adminService.hairmakeupView(gdsNum);
				model.addAttribute("hairmakeupvo", hairmakeupvo);
				break;
			case "104":
				StudiodetailVO studiovo = adminService.studioView(gdsNum);
				model.addAttribute("studiovo", studiovo);
				break;
			case "105":
				SnapshotDvddetailVO snapshotdvdvo = adminService.snapshotdvdView(gdsNum);
				model.addAttribute("snapshotdvdvo", snapshotdvdvo);
				break;
			case "106":
				MendressdetailVO mendressvo = adminService.mendressView(gdsNum);
				model.addAttribute("mendressvo", mendressvo);
				break;
			case "107":
				HanbokdetailVO hanbokgvo = adminService.hanbokView(gdsNum);
				model.addAttribute("hanbokgvo", hanbokgvo);
				break;
			case "108":
				BouquetdetailVO bouquetgvo = adminService.bouquetView(gdsNum);
				model.addAttribute("bouquetgvo", bouquetgvo);
				break;
			case "109":
				InvitationdetailVO invitvo = adminService.invitView(gdsNum);
				model.addAttribute("invitvo", invitvo);
				break;
			default:
				System.out.println("카테고리 101~109번사이가 아닐때 나타나는 오류입니다");
				break;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		

	}

	// 상품 수정
	@RequestMapping(value = "/goods/modify", method = RequestMethod.GET)
	public void getGoodsModify(@RequestParam("n") int gdsNum, Model model) throws Exception {
		// @RequestParam("n")으로 인해, URL주소에 있는 n의 값을 가져와 gdsNum에 저장

		logger.info("get goods modify");

		GoodsViewVO goods = adminService.goodsView(gdsNum); // GoodsViewVO형태 변수 goods에 상품 정보 저장
		model.addAttribute("goods", goods);
		
		String detail = goods.getCateCode();
		try {
			switch (detail) {
			case "101":
				WeddinghalldetailVO weddingvo = adminService.weddingView(gdsNum);
				model.addAttribute("weddingvo", weddingvo);
				break;
			case "102":
				DressdetailVO dressvo = adminService.dressView(gdsNum);
				model.addAttribute("dressvo", dressvo);
				break;
			case "103":
				HairMakeupdetailVO hairmakeupvo = adminService.hairmakeupView(gdsNum);
				model.addAttribute("hairmakeupvo", hairmakeupvo);
				break;
			case "104":
				StudiodetailVO studiovo = adminService.studioView(gdsNum);
				model.addAttribute("studiovo", studiovo);
				break;
			case "105":
				SnapshotDvddetailVO snapshotdvdvo = adminService.snapshotdvdView(gdsNum);
				model.addAttribute("snapshotdvdvo", snapshotdvdvo);
				break;
			case "106":
				MendressdetailVO mendressvo = adminService.mendressView(gdsNum);
				model.addAttribute("mendressvo", mendressvo);
				break;
			case "107":
				HanbokdetailVO hanbokgvo = adminService.hanbokView(gdsNum);
				model.addAttribute("hanbokgvo", hanbokgvo);
				break;
			case "108":
				BouquetdetailVO bouquetgvo = adminService.bouquetView(gdsNum);
				model.addAttribute("bouquetgvo", bouquetgvo);
				break;
			case "109":
				InvitationdetailVO invitvo = adminService.invitView(gdsNum);
				model.addAttribute("invitvo", invitvo);
				break;
			default:
				System.out.println("카테고리 101~109번사이가 아닐때 나타나는 오류입니다");
				break;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<CategoryVO> category = null;
		category = adminService.category();
		model.addAttribute("category", JSONArray.fromObject(category));
	}

	// 상품 수정
	@RequestMapping(value = "/goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, WeddinghalldetailVO weddingvo, DressdetailVO dressvo,
			HairMakeupdetailVO handmvo, StudiodetailVO studiovo, SnapshotDvddetailVO snapshotdvdvo,
			MendressdetailVO mendressvo, HanbokdetailVO hanbokvo, BouquetdetailVO bouquetvo, InvitationdetailVO invitvo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post goods modify");

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("gdsImg")).delete();
			new File(uploadPath + req.getParameter("gdsThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(),
					ymdPath);

			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setGdsThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { 
			// 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setGdsImg(req.getParameter("gdsImg"));
			vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));

		}
		adminService.goodsModify(vo);
		String detail = vo.getCateCode();
		try {
			switch (detail) {
			case "101":
			adminService.weddingmodify(weddingvo);
				break;
			case "102":
				adminService.dressmodify(dressvo);
				break;
			case "103":
				adminService.handmmodify(handmvo);
				break;
			case "104":
				adminService.studiomodify(studiovo);
				break;
			case "105":
				adminService.snapshotmodify(snapshotdvdvo);
				break;
			case "106":
				adminService.mendressmodify(mendressvo);
				break;
			case "107":
				adminService.hanbokmodify(hanbokvo);
				break;
			case "108":
				adminService.bouquetmodify(bouquetvo);
				break;
			case "109":
				adminService.invitmodify(invitvo);
				break;
			default:
				return "/";

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		return "redirect:/admin/index";
	}

	// 상품 삭제
	@RequestMapping(value = "/goods/delete", method = RequestMethod.POST)
	public String postGoodsDelete(@RequestParam("n") int gdsNum, Model model) throws Exception {
		// @RequestParam("n")으로 인해, URL주소에 있는 n의 값을 가져와 gdsNum에 저장

		logger.info("post goods delete");
		GoodsViewVO goods = adminService.goodsView(gdsNum); // GoodsViewVO형태 변수 goods에 상품 정보 저장
		model.addAttribute("goods", goods);
		adminService.goodsDelete(gdsNum);
		String detail = goods.getCateCode();
		try {
			switch (detail) {
			case "101":
				adminService.weddingDelete(gdsNum);
				break;
			case "102":
				adminService.dressDelete(gdsNum);
				break;
			case "103":
				adminService.hairmakeupDelete(gdsNum);
				break;
			case "104":
				adminService.studioDelete(gdsNum);
				break;
			case "105":
				adminService.snapshotdvdDelete(gdsNum);
				break;
			case "106":
				adminService.mendressDelete(gdsNum);
				break;
			case "107":
				adminService.hanbokDelete(gdsNum);
				break;
			case "108":
				adminService.bouquetDelete(gdsNum);
				break;
			case "109":
				adminService.invitDelete(gdsNum);
				break;
			default:
				System.out.println("카테고리 101~109번사이가 아닐때 나타나는 오류입니다");
				break;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

		return "redirect:/admin/index";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		logger.info("post CKEditor img upload");

		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>");

			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}

	// 주문 목록
	@RequestMapping(value = "/shop/orderList", method = RequestMethod.GET)
	public void getOrderList(Model model) throws Exception {
		logger.info("get order list");

		List<OrderVO> orderList = adminService.orderList();

		model.addAttribute("orderList", orderList);
	}

	// 주문 상세 목록
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.GET)
	public void getOrderList(@RequestParam("n") String orderId, OrderVO order, Model model) throws Exception {
		logger.info("get order view");

		order.setOrderId(orderId);
		List<OrderListVO> orderView = adminService.orderView(order);

		model.addAttribute("orderView", orderView);
	}

	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "/shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) throws Exception {
		logger.info("post order view");

//		adminService.delivery(order);

		// 새로운 Service → DAO → Mapper 를 사용하지 않고, 기존에 있던 Service를 사용
		List<OrderListVO> orderView = adminService.orderView(order);

		// 생성자 사용
		GoodsVO goods = new GoodsVO();

		for (OrderListVO i : orderView) {
			goods.setGdsNum(i.getGdsNum());
			goods.setGdsStock(i.getCartStock());
			adminService.changeStock(goods);
		}

		return "redirect:/admin/shop/orderView?n=" + order.getOrderId();
	}

	/*
	 * // 모든 소감(댓글)
	 * 
	 * @RequestMapping(value = "/shop/allReply", method = RequestMethod.GET) public
	 * void getAllReply(Model model) throws Exception {
	 * logger.info("get all reply");
	 * 
	 * List<ReplyListVO> reply = adminService.allReply();
	 * 
	 * model.addAttribute("reply", reply); }
	 * 
	 * // 모든 소감(댓글)
	 * 
	 * @RequestMapping(value = "/shop/allReply", method = RequestMethod.POST) public
	 * String postAllReply(ReplyVO reply) throws Exception {
	 * logger.info("post all reply");
	 * 
	 * adminService.deleteReply(reply.getRepNum());
	 * 
	 * return "redirect:/admin/shop/allReply"; }
	 */
}
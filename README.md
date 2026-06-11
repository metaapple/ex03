# 📚 ex03 - Java Web Application Advanced

> Java Servlet과 JSP를 이용한 고급 웹 애플리케이션 학습 프로젝트

## 📋 프로젝트 개요

이 프로젝트는 Java의 Servlet과 JSP(JavaServer Pages)를 활용하여 고급 동적 웹 애플리케이션을 개발하는 방법을 학습하는 프로젝트입니다.

**주요 기술 스택:**
- ☕ **Java 100%**
- 🚀 **Servlet**: HTTP 요청 처리 및 동적 응답 생성
- 📄 **JSP**: 서버 사이드 템플릿 엔진으로 HTML 생성
- 🔐 **세션 관리**: 사용자 상태 유지
- 📨 **요청/응답 처리**: 폼 데이터 처리 및 검증

---

## 🏗️ 프로젝트 아키텍처

```mermaid
graph TB
    A[HTTP 요청<br/>Client Browser] -->|요청| B{Request Router}
    
    B -->|GET/POST| C[Servlet Layer]
    B -->|*.jsp| D[JSP Pages]
    
    C -->|처리| C1["요청 파라미터 추출"]
    C -->|비즈니스 로직| C2["데이터 처리"]
    C -->|응답 생성| C3["응답 전송"]
    
    D -->|동적 콘텐츠| D1["데이터 표시"]
    D -->|사용자 인터랙션| D2["폼 제출"]
    
    C3 -->|응답| E["HTTP Response"]
    D1 -->|응답| E
    D2 -->|응답| E
    
    E -->|렌더링| F["Client Browser"]

    style A fill:#e1f5ff
    style F fill:#e1f5ff
    style C fill:#fff3e0
    style D fill:#f3e5f5
    style E fill:#e8f5e9
```

---

## 📁 프로젝트 구조

```
ex03/
├── src/main/
│   ├── java/
│   │   └── org/scoula/ex3/
│   │       ├── [Servlet 클래스들]
│   │       └── [Utility 클래스들]
│   │
│   └── webapp/
│       ├── WEB-INF/
│       │   └── web.xml               📋 배포 설명자
│       ├── index.jsp                 🏠 메인 페이지
│       ├── [여러 JSP 페이지들]
│       └── [정적 자원들]
```

---

## 🔧 핵심 컴포넌트 분석

### 1️⃣ **Servlet 클래스들**

Servlet 클래스들은 HTTP 요청을 처리하고 동적 응답을 생성합니다.

**주요 기능:**
- GET/POST 요청 처리
- 요청 파라미터 추출 및 검증
- 한글 인코딩 처리
- 응답 생성 및 전송

### 2️⃣ **JSP 페이지들**

JSP는 서버 사이드 템플릿 엔진으로 동적 HTML을 생성합니다.

**주요 기능:**
- 동적 콘텐츠 렌더링
- 사용자 입력 폼 제공
- 데이터 표시
- 세션/쿠키 관리

### 3️⃣ **배포 설정**

#### **web.xml** - Deployment Descriptor
```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee 
         http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">

    <!-- Servlet 정의 및 매핑 -->
    
</web-app>
```

**📝 설명:**
- `<servlet>`: 서블릿 클래스 등록
- `<servlet-mapping>`: URL 패턴과 서블릿 연결

---

## 🎯 Servlet 생명주기 흐름

```mermaid
sequenceDiagram
    actor Client
    participant Tomcat
    participant Servlet
    
    Client->>Tomcat: 첫 요청
    activate Tomcat
    Tomcat->>Servlet: 인스턴스 생성 (new)
    activate Servlet
    Tomcat->>Servlet: init() 호출
    Note over Servlet: 초기화: 리소스 할당
    Servlet-->>Tomcat: init() 완료
    Tomcat->>Servlet: service() 호출
    Note over Servlet: 요청 처리<br/>doGet() 또는 doPost()
    Servlet-->>Tomcat: 응답 반환
    Tomcat-->>Client: HTTP 응답
    
    Client->>Tomcat: 두 번째 요청
    Note over Servlet: 기존 인스턴스 재사용
    Tomcat->>Servlet: service() 호출
    Servlet-->>Tomcat: 응답 반환
    Tomcat-->>Client: HTTP 응답
    
    Client->>Tomcat: 서버 종료/언로드
    Tomcat->>Servlet: destroy() 호출
    Note over Servlet: 정리: 리소스 해제
    Servlet-->>Tomcat: destroy() 완료
    deactivate Servlet
    deactivate Tomcat
```

---

## 📌 JSP 처리 흐름

```mermaid
graph LR
    A["JSP 파일<br/>(*.jsp)"] -->|1. 변환| B["Java Servlet<br/>클래스로 변환"]
    B -->|2. 컴파일| C["클래스 파일<br/>(*.class)"]
    C -->|3. 로드| D["메모리 로드"]
    D -->|4. 실행| E["서블릿 실행<br/>service() 메서드"]
    E -->|5. 생성| F["HTML 응답"]
    F -->|6. 전송| G["브라우저"]
    
    style A fill:#f3e5f5
    style B fill:#e8f5e9
    style C fill:#e3f2fd
    style D fill:#fff3e0
    style E fill:#fce4ec
    style F fill:#e0f2f1
    style G fill:#f1f8e9
```

---

## 🚀 JSP 주요 문법

### 스크립트릿 (Scriptlet)
```jsp
<% 
    // Java 코드 작성
    int x = 10;
    String name = "Korean";
%>
```

### 표현식 (Expression)
```jsp
<%= x %>                    <!-- 변수 출력 -->
<%= "Hello " + name %>      <!-- 식 계산 및 출력 -->
```

### 지시어 (Directive)
```jsp
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="header.jsp" %>
```

### 주석 (Comments)
```jsp
<%-- JSP 주석: 브라우저에 전송 안 됨 --%>
<!-- HTML 주석: 브라우저에 전송됨 -->
```

### 내장 객체 (Implicit Objects)
```jsp
<% 
    out.print("출력");           // PrintWriter
    String param = request.getParameter("name");  // HttpServletRequest
    response.setContentType("text/html");         // HttpServletResponse
%>
```

---

## 🔐 보안 및 인코딩

| 항목 | 설정 | 목적 |
|------|------|------|
| **문자 인코딩** | `charset=UTF-8` | 한글 깨짐 방지 |
| **Content-Type** | `text/html` | MIME 타입 지정 |
| **XSS 방지** | `out.print()` | 스크립트 태그 안전 처리 |
| **세션 관리** | `session` 객체 | 사용자 상태 유지 |

---

## 💡 학습 포인트

### ✅ Servlet 학습 목표
- [ ] Servlet 기본 구조 이해
- [ ] 생명주기 메서드 (init, doGet, doPost, destroy)
- [ ] HttpRequest/HttpResponse 처리
- [ ] 한글 인코딩 처리
- [ ] @WebServlet 어노테이션 사용
- [ ] 고급 요청 처리 기법

### ✅ JSP 학습 목표
- [ ] JSP 문법 (스크립트릿, 표현식, 지시어)
- [ ] 내장 객체 (request, response, out, session)
- [ ] 페이지 포함 (`<%@include %>`)
- [ ] 동적 HTML 생성
- [ ] 폼 데이터 처리
- [ ] 고급 데이터 표시 기법

---

## 📚 참고 자료

- [Java Servlet API Documentation](https://docs.oracle.com/javaee/7/api/javax/servlet/package-summary.html)
- [JSP 2.3 Specification](https://projects.eclipse.org/projects/ee4j.jsp)
- [Apache Tomcat Documentation](https://tomcat.apache.org/tomcat-10.0-doc/)

---

## 👨‍💻 개발 환경

- **JDK**: Java 8 이상
- **Servlet API**: 4.0
- **WAS**: Apache Tomcat 9.0+
- **IDE**: IntelliJ IDEA / Eclipse

---

<br>

<img width="2554" height="1427" alt="image" src="https://github.com/user-attachments/assets/b9866daf-68b6-4340-ade9-ef84088a0e01" />
<img width="2571" height="1447" alt="image" src="https://github.com/user-attachments/assets/ce82406b-d570-45e7-803d-f952f970dcc3" />
<img width="2567" height="1446" alt="image" src="https://github.com/user-attachments/assets/65448775-889f-4fe2-98a0-57188522e5d8" />


<img width="2474" height="1950" alt="image" src="https://github.com/user-attachments/assets/afd44173-7249-4eca-8ce4-411524b7467d" />

<img width="2792" height="1845" alt="image" src="https://github.com/user-attachments/assets/70edfc91-df31-45b8-8b20-c4f605d79026" />

<img width="3615" height="1864" alt="image" src="https://github.com/user-attachments/assets/264118f4-e2a4-44ec-98bb-198e824abbf1" />
<img width="3615" height="1864" alt="image" src="https://github.com/user-attachments/assets/2f3da589-fd76-4381-93ae-bf246a8ea28d" />



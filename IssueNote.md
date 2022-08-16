
  
  

# 🧷 Issue - Comma
  

</br>


## Issue 1.

#### QLRM에서 같은 동작 반복

- SELECT문을 받아 List<Dto> 반환 동작반복

<div>
	<img width=400 height=400 src="https://user-images.githubusercontent.com/99931188/184785240-99dd26bc-6a4e-4441-9c5f-f54fc1cc179f.jpg">
	<img width=400 height=400 src="https://user-images.githubusercontent.com/99931188/184785614-40fe4d36-64ec-4067-8fe0-d2bcf9d4e2cc.jpg">
</div>


#### solutaion 1)


      @Repository
      @RequiredArgsConstructor
      public class QlrmRepository<T> {  

			@Autowired
			EntityManager entityManager;

			public List<T> returnDataList(String queryText, Class<T> target) {
				Query query = entityManager.createNativeQuery(queryText);
				JpaResultMapper jpaResultMapper = new JpaResultMapper();
				return (List<T>) jpaResultMapper.list(query, target);
			}
	  }
	

<br>


	@SpringBootTest
    public class testQlrmRepostiorty {
    
	    @Autowired
		QlrmRepository testRepository;

		@Autowired
		AdminTableDtoRepository targetRepository;

		String queryText = "select address, count(address) as count\r\n" + "from house\r\n"
				+ "group by address order by count desc";

		@Test
		public void test1() throws Exception {
			System.out.println("테스트 시작");
			// given
			List<AdmintableDto> oldAdto = targetRepository.loadAddressHouseCount();

			// when
			List<AdmintableDto> testAdto = testRepository.returnDataList(queryText, AdmintableDto.class);

			// then
			assertThat(testAdto).isEqualTo(oldAdto);
		}
	}


<br>

#### 테스트 결과
![Screenshot_3](https://user-images.githubusercontent.com/99931188/184797530-45bf963c-8023-4801-afc8-3ec4cf9d95f4.jpg)

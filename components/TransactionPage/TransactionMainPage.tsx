import styled from 'styled-components';
import { Button } from 'semantic-ui-react';

const StyledContainer = styled.div`
  display: flex;
  height: 100vh;
  flex-direction: column;
  justify-content: center;
  align-items: center;
`;

const TransactionPage = () => (
  <StyledContainer>
      <Button primary>트랜잭션 ㄱㄱ</Button>
  </StyledContainer>
);
export default TransactionPage;

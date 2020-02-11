import { NavHeader } from "../components/Common/NavHeader";

interface IPageLayoutProps {
  children: JSX.Element;
}

const PageLayout = (props: IPageLayoutProps) => (
  <>
    <NavHeader />
    {props.children}
    {/* <NavBottomFooter /> */}
  </>
);

export default PageLayout;

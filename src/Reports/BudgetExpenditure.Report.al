
Report 52193734 "Budget/Expenditure"
{
	RDLCLayout = './Layouts/BudgetExpenditure.rdlc'; DefaultLayout = RDLC;

	dataset
	{
		dataitem("G/L Account";"G/L Account")
		{
			DataItemTableView = where("Account Type"=const(Posting));
			column(ReportForNavId_1; 1) {} // Autogenerated by ForNav - Do not delete
			column(NetChange_GLAccount; "G/L Account"."Net Change")
			{
			}
			column(No_GLAccount; "G/L Account"."No.")
			{
			}
			column(Name_GLAccount; "G/L Account".Name)
			{
			}
			column(BudgetedAmount_GLAccount; "G/L Account"."Budgeted Amount")
			{
			}
			column(BalanceatDate_GLAccount; "G/L Account"."Balance at Date")
			{
			}
			column(Percentage_Spent; DiffPct)
			{
			}
			column(Varience; "Vari")
			{
			}
			column(city; CompanyInfo.City)
			{
			}
			column(phone; CompanyInfo."Phone No.")
			{
			}
			column(postcode; CompanyInfo."Post Code")
			{
			}
			column(address2; CompanyInfo."Address 2")
			{
			}
			column(address1; CompanyInfo.Address)
			{
			}
			column(name; CompanyInfo.Name)
			{
			}
			column(picture; CompanyInfo.Picture)
			{
			}
			column(email; CompanyInfo."E-Mail")
			{
			}
			column(website; CompanyInfo."Home Page")
			{
			}
			trigger OnAfterGetRecord();
			begin
				CalcFields("Net Change","Budgeted Amount","Balance at Date");
				GLAcc2 := "G/L Account";
				GLAcc2.CalcFields("Budget at Date");
				if "Budgeted Amount" = 0 then
				  DiffPct := 0
				else
				  DiffPct := "Net Change" / "Budgeted Amount";// * 100;
				if "Budgeted Amount" = 0 then
				"Vari":=0
				else
				"Vari":= "Budgeted Amount"-"Net Change";
				if "G/L Account".Type = "G/L Account".Type::Income then
				  CurrReport.Skip;
			end;
			
		}
	}
	requestpage
	{
		SaveValues = false;
		layout
		{
			area(Content)
			{
				group(Options)
				{
					Caption = 'Options';
					
				}
			}
		}

	}

	

	trigger OnPreReport()
	begin
		GLFilter := "G/L Account".GetFilters;
		PeriodText := "G/L Account".GetFilter("Date Filter");
		GLBudgetFilter := "G/L Account".GetFilter("Budget Filter");
		CompanyInfo.Get;
		CompanyInfo.CalcFields(CompanyInfo.Picture);
		
	end;
	var
		GLAcc2: Record "G/L Account";
		AccountingPeriod: Record "Accounting Period";
		GLFilter: Text;
		GLBudgetFilter: Text[30];
		PeriodText: Text[30];
		EndDate: Date;
		DiffPct: Decimal;
		DiffAtDatePct: Decimal;
		GLAccountTypePosting: Boolean;
		Vari: Decimal;
		CompanyInfo: Record "Company Information";

}

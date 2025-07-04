public class AccountAction {
  @InvocableMethod
  public static List<Decimal> updateAccRevenue(List<Id> ids) {
    List<Opportunity> oppList = [
      SELECT AccountId, Amount
      FROM Opportunity
      WHERE Id = :ids[0]
    ];

    List<Account> accList = [
      SELECT AnnualRevenue
      FROM Account
      WHERE Id = :oppList[0].accountId
    ];

    List<Decimal> annualRevenueList = new List<Decimal>();

    accList[0].AnnualRevenue = accList[0].AnnualRevenue + oppList[0].Amount;

    update accList;

    annualRevenueList.add(accList[0].AnnualRevenue);

    return annualRevenueList;
  }
}
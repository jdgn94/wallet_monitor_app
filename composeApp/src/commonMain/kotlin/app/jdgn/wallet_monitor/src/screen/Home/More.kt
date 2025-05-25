import androidx.compose.foundation.gestures.Orientation
import androidx.compose.foundation.gestures.scrollable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.rememberScrollState
import androidx.compose.foundation.verticalScroll
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import app.jdgn.expense_monitor.CurrentPlatform
import app.jdgn.expense_monitor.currentPlatform
import app.jdgn.expense_monitor.src.components.CustomListItem
import app.jdgn.expense_monitor.src.components.CustomListSubTitle
import walletmonitor.composeapp.generated.resources.Res
import walletmonitor.composeapp.generated.resources.about
import walletmonitor.composeapp.generated.resources.accounts
import walletmonitor.composeapp.generated.resources.arrows_up_down
import walletmonitor.composeapp.generated.resources.bank
import walletmonitor.composeapp.generated.resources.biometric
import walletmonitor.composeapp.generated.resources.calendar
import walletmonitor.composeapp.generated.resources.card
import walletmonitor.composeapp.generated.resources.expenses_income
import walletmonitor.composeapp.generated.resources.face_id
import walletmonitor.composeapp.generated.resources.feedback
import walletmonitor.composeapp.generated.resources.fingerprint
import walletmonitor.composeapp.generated.resources.goal
import walletmonitor.composeapp.generated.resources.info
import walletmonitor.composeapp.generated.resources.message
import walletmonitor.composeapp.generated.resources.more
import walletmonitor.composeapp.generated.resources.movements
import walletmonitor.composeapp.generated.resources.password
import walletmonitor.composeapp.generated.resources.person
import walletmonitor.composeapp.generated.resources.persons
import walletmonitor.composeapp.generated.resources.piggy
import walletmonitor.composeapp.generated.resources.pin
import walletmonitor.composeapp.generated.resources.security
import walletmonitor.composeapp.generated.resources.settings

object More {
    @Composable
    fun Content(navController: NavHostController = rememberNavController()) {
        val scrollState = rememberScrollState()

        Column(
            modifier = Modifier
                .fillMaxSize()
                .verticalScroll(scrollState),
            verticalArrangement = Arrangement.Top,
            horizontalAlignment = Alignment.Start
        ) {
            CustomListSubTitle(textResource = Res.string.movements)
            CustomListItem(
                icon = Res.drawable.calendar,
                titleResource = Res.string.calendar,
            )
            CustomListItem(
                icon = Res.drawable.piggy,
                titleResource = Res.string.goal,
            )
            CustomListItem(
                icon = Res.drawable.arrows_up_down,
                titleResource = Res.string.expenses_income,
            )
            CustomListSubTitle(textResource = Res.string.accounts)
            CustomListItem(
                icon = Res.drawable.bank,
                titleResource = Res.string.accounts,
                onClick = { navController.navigate("accounts") }
            )
            CustomListItem(
                icon = Res.drawable.person,
                titleResource = Res.string.persons,
            )
            CustomListSubTitle(textResource = Res.string.security)
            CustomListItem(
                icon = Res.drawable.password,
                titleResource = Res.string.pin,
            )
            CustomListItem(
                icon =
                    if (currentPlatform == CurrentPlatform.ANDROID)
                        Res.drawable.fingerprint
                    else
                        Res.drawable.face_id,
                titleResource =
                    if (currentPlatform == CurrentPlatform.ANDROID)
                        Res.string.biometric
                    else
                        Res.string.face_id,
            )
            CustomListSubTitle(textResource = Res.string.more)
            CustomListItem(
                icon = Res.drawable.settings,
                titleResource = Res.string.settings,
            )
            CustomListItem(
                icon = Res.drawable.info,
                titleResource = Res.string.about,
            )
            CustomListItem(
                icon = Res.drawable.message,
                titleResource = Res.string.feedback,
            )
        }
    }
}
package net.jeeeyul.pdetools.internal

import org.eclipse.jface.preference.PreferencePage
import org.eclipse.ui.IWorkbenchPreferencePage
import org.eclipse.swt.widgets.Composite
import org.eclipse.ui.IWorkbench
import net.jeeeyul.pdetools.shared.SWTExtensions
import org.eclipse.swt.SWTimport net.jeeeyul.pdetools.shared.SharedImages
import org.eclipse.swt.program.Program
import org.eclipse.ui.dialogs.PreferencesUtil

class PDEToolsPreferncePage extends PreferencePage implements IWorkbenchPreferencePage {
	def static getId(){
		typeof(PDEToolsPreferncePage).canonicalName
	}

	extension SWTExtensions = new SWTExtensions

	override protected createContents(Composite parent) {
		var result = new Composite(parent, SWT::NORMAL) => [
			layout = newGridLayout[
				numColumns = 2
			]
			
			newLabel[
				image = SharedImages::getImage(SharedImages::GITHUB)
			]
			
			newLink[
				text = '''Fork me on <a href="https://github.com/jeeeyul/pde-tools">GitHub</a>, also don't forget <a href="https://marketplace.eclipse.org/content/pde-tools">favorite me on marketplace</a>.'''
				onSelection = [
					Program::launch(it.text)
				]
			]
			
			newLabel[
				image = SharedImages::getImage(SharedImages::PLEDGIE)
			]
			newLink[
				text = '''You can <a href="https://pledgie.com/campaigns/18377">donate to this project through Pledgie</a>.'''
				onSelection = [
					Program::launch(it.text)
				]
			]
			
		]
		update()
		return result
	}

	def update() {
	}

	override init(IWorkbench workbench) {
	}
	
	def navigateToOtherPage(String pageId) {
		PreferencesUtil::createPreferenceDialogOn(shell, pageId, null, null);
	}
}